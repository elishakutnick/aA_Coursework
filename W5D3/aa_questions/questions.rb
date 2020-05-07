require_relative 'questions_database'

class Question 
    def self.find_by_id(id)
        question = QuestionsDatabase.instance.execute(<<-SQL, id: id)
            SELECT
                *
            FROM
                questions
            WHERE
                questions.id = :id
          SQL

          # Question.new(question)
    end
    
    attr_accessor :title, :body, :author_id
    def initialize(options_hash)
      @id = options_hash[@id]
      @title = options_hash[@title]
      @body = options_hash[@body]
      @author_id = options_hash[@author_id]

      # 'title' => 'Next Question', body, author_id 
    end

end

p Question.find_by_id(1)
