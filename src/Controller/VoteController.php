<?php

namespace App\Controller;

use App\Model\VoteManager;

class VoteController extends AbstractController
{
    public function index(): string
    {
        $voteManager = new voteManager();
        $projects = $voteManager->selectAll('number_of_vote', 'DESC', 'name', 'ASC');


        return $this->twig->render('Project/index.html.twig', ['projects' => $projects]);
    }


    public function addVote(int $id): void
    {
        $voteManager = new VoteManager();
        $votes = $voteManager->addVote($id);

        header('Location: /project/index');
        // return $this->twig->render('Project/index.html.twig', ['votes' => $votes]);
    }
}
