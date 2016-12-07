class Postulation < ApplicationRecord
validates :descripcion , :presence => {:message => "Usted debe ingresar una descripcion"}
#validates_uniqueness_of :user_id, conditions: => {:message=> "Usted ya se ha postulado para realizar este favor"}
validate :user_id, :favor_id, :validar
belongs_to :favor
belongs_to :user

  def validar
     @postulations=Postulation.where(:user_id => user_id).all
       @postulations.each do |p|
          if p.favor_id == favor_id
            errors.add(:base , "Ya se postulo a este favor ")
          end
        end
    end

end
