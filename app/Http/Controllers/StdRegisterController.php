<?php

namespace App\Http\Controllers;

use App\Http\Requests\StdRegisterRequest;
use Illuminate\Http\Request;

class StdRegisterController extends Controller
{
    public function register(StdRegisterRequest $request)
    {
        return response()->json([
            'source' => 'std',
            'data' => $request->all(),
        ]);
    }
}
