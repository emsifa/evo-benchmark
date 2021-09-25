<?php

namespace App\Dtos;

use Emsifa\Evo\Dto;
use Emsifa\Evo\Rules\Email;
use Emsifa\Evo\Rules\Max;
use Emsifa\Evo\Rules\Required;

class EvoRegisterDto extends Dto
{
    #[Required]
    #[Max(100)]
    public string $name;

    #[Required]
    #[Email]
    public string $email;

    #[Required]
    public string $password;
}
