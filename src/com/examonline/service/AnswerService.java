package com.examonline.service;

import java.util.List;

import com.examonline.entity.Answer;
import com.examonline.entity.Score;

public interface AnswerService extends BaseService<Answer> {

	void saveAnswers(List<Answer> handleAnswer, Score score);

}
