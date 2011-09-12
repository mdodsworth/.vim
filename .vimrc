set nocompatible
set modelines=0

set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab

set encoding=utf-8
set scrolloff=3
set autoindent
set showmode
set showcmd
set hidden
set wildmenu
set wildmode=list:longest
set visualbell
set cursorline
set ttyfast
set ruler
set backspace=indent,eol,start
set laststatus=2
set relativenumber
set undofile

let mapleader = ","

nnoremap / /\v
vnoremap / /\v
set ignorecase
set smartcase
set gdefault
set incsearch
set showmatch
set hlsearch
nnoremap <leader><space> :noh<cr>
nnoremap <tab> %
vnoremap <tab> %

set wrap
set textwidth=121
set formatoptions=qrn1
set colorcolumn=121

nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>
nnoremap j gj
nnoremap k gk

inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>

nnoremap ; :

inoremap jj <ESC>

nnoremap <leader>w <C-w>v<C-w>l
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
import java.io.*;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

import com.google.common.io.ByteStreams;
import com.google.common.io.Files;

/**
 * Util
 *
 * @author gbaker
 * @since 158
 */
public class FileUtil {

    /**
     * use a persisted digest so that we're not constantly updating the ipr file whenever intellij decides to update it
     */
    static void writeIfDifferent(StringWriter writer, File outputFile) throws IOException {

        // check that the output directory is present
        File parent = outputFile.getParentFile();
        if (parent != null && !parent.exists()) {
            if (!parent.mkdirs()) throw new FileNotFoundException(parent.getAbsolutePath());
        }

        File digestFile = new File(outputFile.getParent(), "." + outputFile.getName() + ".sha256");
        writeIfDigestDiffers(writer, outputFile, digestFile);
    }

    private static boolean writeIfDigestDiffers(StringWriter writer, File outputFile, File digestFile) throws IOException {

        byte[] writerBytes = writer.getBuffer().toString().getBytes("UTF-8");
        byte[] digest = ByteStreams.getDigest(ByteStreams.newInputStreamSupplier(writerBytes), getMessageDigest());

        // if the digest or output file doesn't exist, we'll need to write both 
        boolean shouldWriteFiles = !digestFile.exists() || !outputFile.exists();

        // if the digests differ, overwrite both the file and the digest
        shouldWriteFiles = shouldWriteFiles
                           || !ByteStreams.equal(Files.newInputStreamSupplier(digestFile), ByteStreams.newInputStreamSupplier(digest));

        if (shouldWriteFiles) {
            writeFile(writerBytes, outputFile);
            writeFile(digest, digestFile);
        }
        
        return shouldWriteFiles;
