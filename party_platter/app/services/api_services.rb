require "net/http"
require "uri"
require "json"
class ApiServices

    def self.equipment_keys
        response = HTTParty.get("https://www.dnd5eapi.co/api/equipment")
        data = JSON.parse(response.body)
        equipment = []
        all_keys = Set.new
        data["results"].each do |result|
            equipment << result["name"]
            response = HTTParty.get("https://www.dnd5eapi.co"+result["url"])
            equipment_data = JSON.parse(response.body)
            equipment_data.each{|key, value| all_keys.add(key)}             
        end
        return all_keys
    end

    def self.spells_keys
        response = HTTParty.get("https://www.dnd5eapi.co/api/spells")
        data = JSON.parse(response.body)
        spells = []
        all_keys = Set.new
        data["results"].each do |result|
            spells << result["name"]
            response = HTTParty.get("https://www.dnd5eapi.co"+result["url"])
            spells_data = JSON.parse(response.body)
            spells_data.each{|key, value| all_keys.add(key)}
        end
        return all_keys
    end

    def self.monster_keys
        response = HTTParty.get("https://www.dnd5eapi.co/api/monsters")
        data = JSON.parse(response.body)
        monsters = []
        all_keys = Set.new
        data["results"].each do |result|
            monsters << result["name"]
            response = HTTParty.get("https://www.dnd5eapi.co"+result["url"])
            monsters_data = JSON.parse(response.body)
            monsters_data.each{|key, value| all_keys.add(key)}
        end
        return all_keys
    end

    # Work on one item getting subhash data //Greatsword//

    def self.greatsword
        response = HTTParty.get("https://www.dnd5eapi.co/api/equipment/greatsword")
        data = JSON.parse(response.body)
        puts(data["damage"]["damage_dice"])
        puts(data["damage"]["damage_type"]["name"])
    end

    # Try to iterate over the list and return only weapons by checking if ["damage"] is present
    def self.weapons_list
        response = HTTParty.get("https://www.dnd5eapi.co/api/equipment")
        data = JSON.parse(response.body)
        equipment = []
        weapons_list = []
        data["results"].each do |result|
            equipment << result["name"]
            response = HTTParty.get("https://www.dnd5eapi.co"+result["url"])
            equipment_data = JSON.parse(response.body)
            weapons_list << equipment_data.select{|i| equipment_data["damage"].present?}
            weapons_list.delete_if{|i| i["index"] == nil}
        end
        for i in weapons_list
            if i["index"].present? then
                puts(i["index"])
            end
        end
    end

end