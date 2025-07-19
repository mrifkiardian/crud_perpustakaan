<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class RoleMiddleware
{

    public function handle(Request $request, Closure $next, ...$roles)
    {
        $user = auth::user();

if (! $user || ! isset($user->role) || ! in_array($user->role, $roles)) {
    abort(403, 'Maaf, Anda tidak dapat mengakses halaman ini.');
}


        return $next($request);
    }
}
