# Imagine that every year life takes a snap shot of what you are
# and if you are dead of alive.

class LifeCycle < ActiveRecord::Base

  belongs_to :human

  enum kind: {
    person: 0,
    animal: 1,
    other: 2,
  }

  # Show me the records where tranformation from animal to human happend
  def self.frog_to_human_period(start_date: DateTime.new(2000,01,01))
    LifeCycle.window(human_id: 1).where("life_cycles.created_at > ? AND life_cycles.kind = 1 AND life_cycles.next_life_kind = 0", start_date)
  end

  def self.window(human_id:)
    from("(SELECT *, 
           lead(kind) OVER (PARTITION BY human_id ORDER BY created_at ASC) AS next_life_kind
           FROM life_cycles
           WHERE human_id = #{human_id}
           ) 
           as life_cycles")
  end

end
