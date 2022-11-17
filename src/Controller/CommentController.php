<?php

namespace App\Controller;

use App\Model\CommentManager;
use App\Model\ProjectManager;

class CommentController extends AbstractController
{
    public function displayCommentsByProjectID(int $id = 1)
    {
        $commentManager = new CommentManager();
        $comments = $commentManager->selectAllByProjectId($id);
        $project = $this->show($id);
        $projects = $this->index();

        return $this->twig->render(
            'Project/project.html.twig',
            ['comments' => $comments, 'project' => $project,
            'projects' => $projects
            ]
        );
    }

    public function project(int $id = 1): ?string
    {
        $project = $this->show($id);
        $projects = $this->index();

        return $this->twig->render(
            'Project/index.html.twig',
            [
                'project' => $project,
                'projects' => $projects
            ]
        );
    }

    public function show(int $id)
    {
        $projectManager = new ProjectManager();
        $project = $projectManager->selectOneById($id);

        return $project;
    }

    public function index()
    {
        $projectManager = new ProjectManager();
        $projects = $projectManager->selectAll('name');

        return $projects;
    }
}
