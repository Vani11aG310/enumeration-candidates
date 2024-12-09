# In this file we define the methods to help filter out candidates
# This way, we keep these methods separated from other potential parts of the program

def find(id)
    # Your code Here
    for candidate in @candidates
      if id == candidate[:id]
        return candidate
      end
    end
    return nil
  end
  
  def experienced?(candidate)
    # Your code Here
    if candidate[:years_of_experience] >= 2
      return true
    else
      return false
    end
  end

  def knowsRubyOrPython?(candidate)
    if candidate[:languages].include?("Ruby") || candidate[:languages].include?("Python")
      return true
    else
      return false
    end
  end

  def hasGoodGithubPoints?(candidate)
    if candidate[:github_points] >= 100
      return true
    else
      return false
    end
  end

  def appliedWithin15Days?(candidate)
    if candidate[:date_applied] > 15.days.ago.to_date
      return true
    else
      return false
    end
  end

  def candidateOldEnough?(candidate)
    if candidate[:age] > 17
      return true
    else
      return false
    end
  end
  
  def qualified_candidates(candidates)
    # Your code Here
    newArray = []
    candidates.each do |candidate|
      if experienced?(candidate) and knowsRubyOrPython?(candidate) and hasGoodGithubPoints?(candidate) and appliedWithin15Days?(candidate) and candidateOldEnough?(candidate)
        newArray.push(candidate)
      end
    end
    return newArray
  end
  
  # More methods will go below

  def ordered_by_qualifications(candidates)
    candidates.sort! {|candidate_a, candidate_b|
      if candidate_b[:years_of_experience] == candidate_a[:years_of_experience]
        candidate_b[:github_points] <=> candidate_a[:github_points]
      else  
        candidate_b[:years_of_experience] <=> candidate_a[:years_of_experience]
      end
    }
  end
