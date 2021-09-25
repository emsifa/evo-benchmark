<?php

namespace App\Http\Controllers;

use App\Dtos\EvoRegisterDto;
use Emsifa\Evo\Http\Body;
use Emsifa\Evo\Route\Post;

class EvoRegisterController extends Controller
{
    #[Post('register')]
    public function register(#[Body] EvoRegisterDto $dto)
    {
        return response()->json([
            'source' => 'evo',
            'data' => $dto,
        ]);
    }
}
