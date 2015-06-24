(function() {
  'use strict';

  angular.module('app.states')
    .run(appRun);

  /** @ngInject */
  function appRun(routerHelper, navigationHelper) {
    routerHelper.configureStates(getStates());
    navigationHelper.navItems(navItems());
    navigationHelper.sidebarItems(sidebarItems());
  }

  function getStates() {
    return {
      'admin.project-questions.edit': {
        url: '/edit/:pqId',
        templateUrl: 'app/states/admin/project-questions/edit/edit.html',
        controller: StateController,
        controllerAs: 'vm',
        title: 'Edit Project Question',
        resolve: {
          projectQuestion: resolveProjectQuestion
        }
      }
    };
  }

  function navItems() {
    return {};
  }

  function sidebarItems() {
    return {};
  }

  /** @ngInject */
  function resolveProjectQuestion(ProjectQuestion, $stateParams) {
    return ProjectQuestion.get({id: $stateParams.pqId}).$promise;
  }

  /** @ngInject */
  function StateController(logger, projectQuestion) {
    var vm = this;

    vm.title = 'Edit Project Question';
    vm.projectQuestion = projectQuestion;
    vm.activate = activate;

    activate();

    function activate() {
      logger.info('Activated Edit Project Question View');
    }
  }
})();
