(function() {
  'use strict';

  angular.module('app.resources')
    .factory('ProjectQuestion', ProjectQuestionFactory);

  /** @ngInject */
  function ProjectQuestionFactory($resource) {
    var ProjectQuestion = $resource('/api/v1/project_questions/:id', {
      id: '@id'
      // 'includes[]': ['options']
    }, {
      update: {
        method: 'PUT',
        isArray: false
      }
    });

    ProjectQuestion.defaults = {
      name: '',
      help: '',
      required: false,
      type: 'multiple',
      options: []
    };

    ProjectQuestion.optionDefaults = {
      option: '',
      include: [],
      exclude: [],
      load_order: 0
    };

    ProjectQuestion.new = newProjectQuestion;

    function newProjectQuestion() {
      return new ProjectQuestion(angular.copy(ProjectQuestion.defaults));
    }

    return ProjectQuestion;
  }
})();
