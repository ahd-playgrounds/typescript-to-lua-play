export function setTimeout(cb: () => void, duration: number): Timer {
  const timer = vim.loop.new_timer();
  timer.start(duration, 0, () => {
    clearInterval(timer);
    cb();
  });
  return timer;
}

export function clearInterval(timer: Timer): void {
  timer.stop();
  timer.close();
}

export function setInterval(cb: () => void, duration: number): Timer {
  const timer = vim.loop.new_timer();
  timer.start(duration, duration, () => {
    cb();
  });
  return timer;
}

export function wait(duration: number): Promise<void> {
  return new Promise((resolve) => {
    setTimeout(() => {
      resolve();
    }, duration);
  });
}
