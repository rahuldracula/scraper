require 'nokogiri'
require 'open-uri'
require 'csv'


class BusWorker
  include Sidekiq::Worker
  sidekiq_options :retry => 5

  def perform(from_city, from_city_id, to_city, to_city_id,date)
    doc = JSON(open('https://mobapi.redbus.in/wdsvc/v1_1/bussearch?fromCityId='+from_city_id.to_s+'&toCityId='+to_city_id.to_s+'&doj='+date).read[3..-1])
    return if doc['data'].nil?
    doc['data'].each do |bus|
    attributes = {
         from_city: from_city,
         to_city: to_city,
         travel_date: date,
         rb_pref_code: bus['RbPrefCode'],
         is_bp_dp_search: bus['IsBpDpSearch'],
         j_dur: bus['jDur'],
         service_id: bus['serviceId'],
         service_name: bus['serviceName'],
         vehicle_type: bus['vt'],
         is_dpa: bus['IsDPA'],
         boarding_location: boarding_location(bus),
         boarding_points: boarding_point_count(bus),
         drop_location: drop_location(bus),
         drop_points: drop_point_count(bus),
         arrival_time: rb_time_convert(bus['ArTm']),
         bus_type: bus['BsTp'],
         departure_time: rb_time_convert(bus['DpTm']),
         fare: bus['FrLst'][0],
         ac: bus['IsAc'],
         not_ac: bus['IsNAc'],
         seater: bus['IsStr'],
         sleeper: bus['IsSlpr'],
         is_spf: bus['IsSpF'],
         is_mte: bus['IsMTE'],
         seats_available: bus['NSA'],
         window_seats: bus['WnSt'],
         operator_id: bus['OpId'],
         rt_id: bus['RtId'],
         operator: bus['Tvs'],
         rating: total_rating(bus['Rtg']),
         rating_count: rating_count(bus['Rtg']['Rt']),
         tips: bus['Tips'],
         glry: bus['Glry'],
         sort: bus['Sort'],
         bs_st: bus['BsSt'],
         bs_sv_id: bus['BsSvId']
    }
      Shot.create(attributes)
    end
  end

  def rating_count(bus_rating)
    bus_rating['Ct'] unless bus_rating.nil?
  end

  def total_rating(bus_rating)
    bus_rating['totRt'] unless bus_rating.nil?
  end

  def drop_location(bus)
    bus['DPLst'][0]['Loc'] unless bus['DPLst'].empty?
  end

  def boarding_location(bus)
    bus['BPLst'][0]['Loc'] unless bus['BPLst'].empty?
  end

  def boarding_point_count(bus)
    bus['BPLst'].count
  end

  def drop_point_count(bus)
    bus['DPLst'].count
  end

  def rb_time_convert(rb_time)
    DateTime.strptime((rb_time.scan(/\d+/).map(&:to_i).first/1000).to_s,'%s')
  end
end