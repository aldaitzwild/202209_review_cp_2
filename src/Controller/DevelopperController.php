<?php

namespace App\Controller;

use App\Model\DevelopperManager;
use App\Model\ProjectManager;

class DevelopperController extends AbstractController
{
    /**
     * Add a new developper
     */
    public function index(): ?string
    {
        if ($_SERVER['REQUEST_METHOD'] === 'POST') {
            // clean $_POST data
            $developper = array_map('trim', $_POST);

            // TODO validations (length, format...)

            // if validation is ok, insert and redirection
            $developperManager = new DevelopperManager();
            $id = $developperManager->insert($developper);

            header('Location:/developpers/show?id=' . $id);
            return null;
        }

        return $this->twig->render('developper/index.html.twig');
    }

    public function add(): ?string
    {
        if ($_SERVER['REQUEST_METHOD'] === 'POST') {
            // clean $_POST data
            $dev = array_map('trim', $_POST);

            // TODO validations (length, format...)

            // if validation is ok, insert and redirection
            $devManager = new DevelopperManager();
            $id = $devManager->insert($dev);

            header('Location:/items/show?id=' . $id);
            return null;
        }

        $projectManager = new ProjectManager();
        $projects = $projectManager->selectAll();
        return $this->twig->render('Developper/_form.html.twig', ['projects' => $projects]);
    }

    // public function selectPartner(): array
    // {
    //     $query = 'SELECT id, lastname, firstname FROM partner ';

    //     return $this->pdo->query($query)->fetchAll();
    // }
}
