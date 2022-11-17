<?php

namespace App\Controller;

use App\Model\ProjectManager;

class ProjectController extends AbstractController
{
    public function presentation(): string
    {
        $projectManager = new ProjectManager();
        $projects = $projectManager->selectAll();
        $presentations = [];
        
        foreach ($projects as $project)
        {
            $comments = $projectManager->displayComments($project['id']);
            $project['comments'] = $comments;
            $presentations[] = $project;

        }


        return $this->twig->render('Presentation/presentation.html.twig', ['presentations' => $presentations]);
    }
}

