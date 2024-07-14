function [n, u, t] = ode_evaluator(df, y, I, y0)
    [t, u] = ode45(df, I, y0);
    
    hold on
    plot(t, u, 'r');
    plot(t, y(t), 'g');

    err = t - u;
    n = norm(err, inf);
end