require 'nokogiri'
require 'open-uri'
require 'csv'


class BusWorker
  include Sidekiq::Worker
  sidekiq_options :retry => 5

  def perform(from_city, from_city_id, to_city, to_city_id,date)
    doc = JSON(open('https://mobapi.redbus.in/wdsvc/v1_1/bussearch?fromCityId='+from_city_id+'&toCityId='+to_city_id+'&doj='+date).read[3..-1])
    return if doc['data'].nil?
    doc['data'].each do |bus|
      CSV.open("bus_data_3.csv", "a+") do |csv|
        csv << [from_city, to_city, bus['RbPrefCode'], bus['IsBpDpSearch'], bus['jDur'], bus['serviceId'], bus['serviceName'], bus['vt'], bus['IsDPA'], boarding_location(bus), boarding_point_count(bus), drop_location(bus), drop_point_count(bus), bus['ArTm'], bus['BsTp'], bus['DpTm'], bus['FrLst'][0], bus['IsAc'], bus['IsNAc'], bus['IsStr'], bus['IsSlpr'], bus['IsSpF'], bus['IsMTE'], bus['NSA'], bus['WnSt'], bus['OpId'], bus['RtId'], bus['Tvs'], total_rating(bus['Rtg']), rating_count(bus['Rtg']['Rt']), bus['Tips'], bus['Glry'], bus['Sort'], bus['BsSt'], bus['BsSvId']]
      end
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
end