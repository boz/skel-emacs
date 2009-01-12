(if (and (boz:add-path "muse/lisp")
         (boz:add-path "planner")
         (boz:add-path "remember"))
    (setq planner-project "LifePlanner")
    (setq muse-project-alist
          '(("LifePlanner"
         ("~/plans"
          :default "index"
          :major-mode planner-mode
          :visit-link planner-visit-link))))

    (require 'planner)
    (require 'planner-timeclock)

    (require 'remember)
    (require 'remember-planner)

    (setq remember-handler-functions '(remember-planner-append))
    (setq remember-annotation-functions planner-annotation-functions))


