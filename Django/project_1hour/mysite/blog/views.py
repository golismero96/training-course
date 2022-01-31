from django.shortcuts import render, get_object_or_404
from .models import Post


def home(request):
    posts = Post.newmanager.all()
    return render(request, 'index.html', {'posts': posts})


def post_single(request, post):
    post = get_object_or_404(Post, slug=post, status='published')

    return render(request, 'single.html', {'post': post})
