Return-Path: <ankur.tyagi85@gmail.com>
Received: from mail-yb0-f194.google.com (mail-yb0-f194.google.com
	[209.85.213.194])
	by arago-project.org (Postfix) with ESMTPS id 2EFA552AC4
	for <meta-arago@arago-project.org>;
	Thu,  9 Feb 2017 17:34:48 +0000 (UTC)
Received: by mail-yb0-f194.google.com with SMTP id o65so424878ybo.3
	for <meta-arago@arago-project.org>;
	Thu, 09 Feb 2017 09:34:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=L+9wCMxfPj3KVGW9RcsGL7aZdyQdh7ktHQI0SYdi37M=;
	b=D/vR72D8biHI5mui32rkZyxFMY0MSNKBbirndibaSJ5idTmJO0Jl3i3EeW65I6GfIc
	ibZEE8RSUVExYB8FNmtxAXS79y0jWxTy5PE1u+kVkEZTab9jnDihRWLzNZddq+isfiuA
	c+8cDhIfp0PEFEPrE0FZmXGdmPlMjKJQqiAxWjJCvGosOOoLdamG8QGDFK1UaoJNHLd1
	joWcHikNiqHqvgUCbMZ8NYqY3okQ1Mir3oGdD8qpHMth1t+LMUBO09gnLfRMJd+2qHyz
	RXco/9kLVG/Y2hdlBecIseVEZaCW7dKMdbmJ3UclNxvp/KJb96RbbZ7oLEi2kftbJqsO
	gN9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=L+9wCMxfPj3KVGW9RcsGL7aZdyQdh7ktHQI0SYdi37M=;
	b=NmXOZXtEiQ6VFbYm7m8GNQHv3qa+l/jLx+AElKhPM7w/3wFbDpvcOSvGlbFWLzKyTm
	s4QTY3z4Q1W9gEoGWMnbitT0++bMrHIfn1VXZ4B28k27GwkosOApbGW56g+VSrPbJMvs
	5gJmhohmMboBU6Bn9juGTRsmhEYGRk7PDF331w354iuJxmG73oFyfh0N5NQKL9fbFtEO
	yx1CUa1bx0UTR+Dw6Y09RgWhHoDh0HDezH3xLImjNapthoM+fwKkORcNmglEw1ZEmyI4
	rT+kYcbO2aObypeGClZXQCp1qCtAM7DeJy7OMClLpQXpYqwLQg3EDFCCmx2WDoOwmLKg
	b4pg==
X-Gm-Message-State: AMke39kpzpXWsRCrOXgNun9ZLT1pSq582zS3eKmApd3UhmMbOsmjsSMUXWTbsqM5wxbJIbrJsKi2jLjOHz/dyg==
X-Received: by 10.37.171.138 with SMTP id v10mr3265466ybi.132.1486661687522;
	Thu, 09 Feb 2017 09:34:47 -0800 (PST)
MIME-Version: 1.0
Received: by 10.129.80.215 with HTTP; Thu, 9 Feb 2017 09:34:27 -0800 (PST)
In-Reply-To: <CADySD0EusK8rAZRf9zk7P6RiMT9BRWWcLaufU0+vjzoCVqBB5Q@mail.gmail.com>
References: <CADySD0GYzbgy90bbYg-Gvz+xS963pEOd0qUExa8TkHGC39U4cg@mail.gmail.com>
	<20170206150057.GA25590@edge>
	<CADySD0EusK8rAZRf9zk7P6RiMT9BRWWcLaufU0+vjzoCVqBB5Q@mail.gmail.com>
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
Date: Fri, 10 Feb 2017 06:34:27 +1300
Message-ID: <CADySD0EGhpRTk3j-LaystCccUkaNvkiPtZ7hrPKC+ep5KM5QTA@mail.gmail.com>
To: Denys Dmytriyenko <denys@ti.com>
Cc: meta-arago@arago-project.org
Subject: Re: tisdk-rootfs-image recipe bitbake error on morty branch
X-BeenThere: meta-arago@arago-project.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Arago metadata layer for TI SDKs - OE-Core/Yocto compatible
	<meta-arago.arago-project.org>
List-Unsubscribe: <http://arago-project.org/cgi-bin/mailman/options/meta-arago>, 
	<mailto:meta-arago-request@arago-project.org?subject=unsubscribe>
List-Archive: <http://arago-project.org/pipermail/meta-arago>
List-Post: <mailto:meta-arago@arago-project.org>
List-Help: <mailto:meta-arago-request@arago-project.org?subject=help>
List-Subscribe: <http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago>, 
	<mailto:meta-arago-request@arago-project.org?subject=subscribe>
X-List-Received-Date: Thu, 09 Feb 2017 17:34:48 -0000
Content-Type: text/plain; charset=UTF-8

Hi Denys,

Anything that you would like me to try in order to fix this error ?

thanks
Ankur

On Tue, Feb 7, 2017 at 5:21 PM, Ankur Tyagi <ankur.tyagi85@gmail.com> wrote:
> Hi,
>
> Here is the log
>
> $ grep external-linaro-toolchain-cross *.dot
> package-depends.dot:"libstdc++-precompile-dev" ->
> "external-linaro-toolchain-cross-arm" [style=solid]
> package-depends.dot:"libitm-staticdev" ->
> "external-linaro-toolchain-cross-arm" [style=solid]
> package-depends.dot:"libsotruss" ->
> "external-linaro-toolchain-cross-arm" [style=solid]
> package-depends.dot:"libgomp-dev" ->
> "external-linaro-toolchain-cross-arm" [style=solid]
> package-depends.dot:"libquadmath-staticdev" ->
> "external-linaro-toolchain-cross-arm" [style=solid]
> package-depends.dot:"libitm-dev" ->
> "external-linaro-toolchain-cross-arm" [style=solid]
> package-depends.dot:"external-linaro-toolchain-mtrace" ->
> "external-linaro-toolchain-cross-arm" [style=solid]
> package-depends.dot:"libasan-staticdev" ->
> "external-linaro-toolchain-cross-arm" [style=solid]
> package-depends.dot:"libmudflap-dev" ->
> "external-linaro-toolchain-cross-arm" [style=solid]
> package-depends.dot:"external-linaro-toolchain-pic" ->
> "external-linaro-toolchain-cross-arm" [style=solid]
> package-depends.dot:"libubsan-dev" ->
> "external-linaro-toolchain-cross-arm" [style=solid]
> package-depends.dot:"libmemusage" ->
> "external-linaro-toolchain-cross-arm" [style=solid]
> package-depends.dot:"libg2c" -> "external-linaro-toolchain-cross-arm"
> [style=solid]
> package-depends.dot:"external-linaro-toolchain-utils" ->
> "external-linaro-toolchain-cross-arm" [style=solid]
> package-depends.dot:"libatomic-dev" ->
> "external-linaro-toolchain-cross-arm" [style=solid]
> package-depends.dot:"external-linaro-toolchain-doc" ->
> "external-linaro-toolchain-cross-arm" [style=solid]
> package-depends.dot:"libstdc++-dev" ->
> "external-linaro-toolchain-cross-arm" [style=solid]
> package-depends.dot:"libsegfault" ->
> "external-linaro-toolchain-cross-arm" [style=solid]
> package-depends.dot:"liblsan" -> "external-linaro-toolchain-cross-arm"
> [style=solid]
> package-depends.dot:"libssp" -> "external-linaro-toolchain-cross-arm"
> [style=solid]
> package-depends.dot:"libtsan-staticdev" ->
> "external-linaro-toolchain-cross-arm" [style=solid]
> package-depends.dot:"libgomp" -> "external-linaro-toolchain-cross-arm"
> [style=solid]
> package-depends.dot:"libstdc++-staticdev" ->
> "external-linaro-toolchain-cross-arm" [style=solid]
> package-depends.dot:"libquadmath-dev" ->
> "external-linaro-toolchain-cross-arm" [style=solid]
> package-depends.dot:"ldd" -> "external-linaro-toolchain-cross-arm" [style=solid]
> package-depends.dot:"libasan-dev" ->
> "external-linaro-toolchain-cross-arm" [style=solid]
> package-depends.dot:"libgfortran-dev" ->
> "external-linaro-toolchain-cross-arm" [style=solid]
> package-depends.dot:"libgfortran-staticdev" ->
> "external-linaro-toolchain-cross-arm" [style=solid]
> package-depends.dot:"liblsan-staticdev" ->
> "external-linaro-toolchain-cross-arm" [style=solid]
> package-depends.dot:"external-linaro-toolchain-cross-arm"
> [label="external-linaro-toolchain-cross-arm
> :1.0-r1\n/home/nws/yocto-morty-dev/sources/meta-arago/meta-arago-extras/recipes-core/meta/external-linaro-toolchain-cross.bb"]
> package-depends.dot:"external-linaro-toolchain-staticdev" ->
> "external-linaro-toolchain-cross-arm" [style=solid]
> package-depends.dot:"libcidn" -> "external-linaro-toolchain-cross-arm"
> [style=solid]
> package-depends.dot:"libubsan-staticdev" ->
> "external-linaro-toolchain-cross-arm" [style=solid]
> package-depends.dot:"sln" -> "external-linaro-toolchain-cross-arm" [style=solid]
> package-depends.dot:"libtsan" -> "external-linaro-toolchain-cross-arm"
> [style=solid]
> package-depends.dot:"nscd" -> "external-linaro-toolchain-cross-arm"
> [style=solid]
> package-depends.dot:"libssp-dev" ->
> "external-linaro-toolchain-cross-arm" [style=solid]
> package-depends.dot:"libubsan" ->
> "external-linaro-toolchain-cross-arm" [style=solid]
> package-depends.dot:"tzcode" -> "external-linaro-toolchain-cross-arm"
> [style=solid]
> package-depends.dot:"libgcc-dbg" ->
> "external-linaro-toolchain-cross-arm" [style=solid]
> package-depends.dot:"external-linaro-toolchain-dbg" ->
> "external-linaro-toolchain-cross-arm" [style=solid]
> package-depends.dot:"libgfortran" ->
> "external-linaro-toolchain-cross-arm" [style=solid]
> package-depends.dot:"libtsan-dev" ->
> "external-linaro-toolchain-cross-arm" [style=solid]
> package-depends.dot:"libssp-staticdev" ->
> "external-linaro-toolchain-cross-arm" [style=solid]
> package-depends.dot:"libgomp-staticdev" ->
> "external-linaro-toolchain-cross-arm" [style=solid]
> package-depends.dot:"libgcc" -> "external-linaro-toolchain-cross-arm"
> [style=solid]
> package-depends.dot:"libgcov-dev" ->
> "external-linaro-toolchain-cross-arm" [style=solid]
> package-depends.dot:"libstdc++" ->
> "external-linaro-toolchain-cross-arm" [style=solid]
> package-depends.dot:"libasan" -> "external-linaro-toolchain-cross-arm"
> [style=solid]
> package-depends.dot:"libatomic" ->
> "external-linaro-toolchain-cross-arm" [style=solid]
> package-depends.dot:"external-linaro-toolchain" ->
> "external-linaro-toolchain-cross-arm" [style=solid]
> package-depends.dot:"external-linaro-toolchain-dev" ->
> "external-linaro-toolchain-cross-arm" [style=solid]
> package-depends.dot:"catchsegv" ->
> "external-linaro-toolchain-cross-arm" [style=solid]
> package-depends.dot:"glibc-extra-nss" ->
> "external-linaro-toolchain-cross-arm" [style=solid]
> package-depends.dot:"libgcc-dev" ->
> "external-linaro-toolchain-cross-arm" [style=solid]
> package-depends.dot:"libmudflap" ->
> "external-linaro-toolchain-cross-arm" [style=solid]
> package-depends.dot:"libitm" -> "external-linaro-toolchain-cross-arm"
> [style=solid]
> package-depends.dot:"liblsan-dev" ->
> "external-linaro-toolchain-cross-arm" [style=solid]
> package-depends.dot:"libmudflap-staticdev" ->
> "external-linaro-toolchain-cross-arm" [style=solid]
> package-depends.dot:"external-linaro-toolchain-pcprofile" ->
> "external-linaro-toolchain-cross-arm" [style=solid]
> package-depends.dot:"libatomic-staticdev" ->
> "external-linaro-toolchain-cross-arm" [style=solid]
> package-depends.dot:"glibc-thread-db" ->
> "external-linaro-toolchain-cross-arm" [style=solid]
> package-depends.dot:"libquadmath" ->
> "external-linaro-toolchain-cross-arm" [style=solid]
> package-depends.dot:"libg2c-dev" ->
> "external-linaro-toolchain-cross-arm" [style=solid]
> pn-depends.dot:"external-linaro-toolchain-cross-arm"
> [label="external-linaro-toolchain-cross-arm
> :1.0-r1\n/home/nws/yocto-morty-dev/sources/meta-arago/meta-arago-extras/recipes-core/meta/external-linaro-toolchain-cross.bb"]
> pn-depends.dot:"external-linaro-toolchain" ->
> "external-linaro-toolchain-cross-arm" [style=solid]
> task-depends.dot:"external-linaro-toolchain.do_configure" ->
> "external-linaro-toolchain-cross-arm.do_populate_sysroot"
> task-depends.dot:"external-linaro-toolchain-cross-arm.do_unpack"
> [label="external-linaro-toolchain-cross-arm
> do_unpack\n:1.0-r1\n/home/nws/yocto-morty-dev/sources/meta-arago/meta-arago-extras/recipes-core/meta/external-linaro-toolchain-cross.bb"]
> task-depends.dot:"external-linaro-toolchain-cross-arm.do_unpack" ->
> "external-linaro-toolchain-cross-arm.do_fetch"
> task-depends.dot:"external-linaro-toolchain-cross-arm.do_install"
> [label="external-linaro-toolchain-cross-arm
> do_install\n:1.0-r1\n/home/nws/yocto-morty-dev/sources/meta-arago/meta-arago-extras/recipes-core/meta/external-linaro-toolchain-cross.bb"]
> task-depends.dot:"external-linaro-toolchain-cross-arm.do_install" ->
> "external-linaro-toolchain-cross-arm.do_compile"
> task-depends.dot:"external-linaro-toolchain-cross-arm.do_compile"
> [label="external-linaro-toolchain-cross-arm
> do_compile\n:1.0-r1\n/home/nws/yocto-morty-dev/sources/meta-arago/meta-arago-extras/recipes-core/meta/external-linaro-toolchain-cross.bb"]
> task-depends.dot:"external-linaro-toolchain-cross-arm.do_compile" ->
> "external-linaro-toolchain-cross-arm.do_configure"
> task-depends.dot:"external-linaro-toolchain-cross-arm.do_configure"
> [label="external-linaro-toolchain-cross-arm
> do_configure\n:1.0-r1\n/home/nws/yocto-morty-dev/sources/meta-arago/meta-arago-extras/recipes-core/meta/external-linaro-toolchain-cross.bb"]
> task-depends.dot:"external-linaro-toolchain-cross-arm.do_configure" ->
> "external-linaro-toolchain-cross-arm.do_create_srcipk"
> task-depends.dot:"external-linaro-toolchain-cross-arm.do_configure" ->
> "external-linaro-toolchain-cross-arm.do_patch"
> task-depends.dot:"external-linaro-toolchain-cross-arm.do_populate_lic"
> [label="external-linaro-toolchain-cross-arm
> do_populate_lic\n:1.0-r1\n/home/nws/yocto-morty-dev/sources/meta-arago/meta-arago-extras/recipes-core/meta/external-linaro-toolchain-cross.bb"]
> task-depends.dot:"external-linaro-toolchain-cross-arm.do_populate_lic"
> -> "external-linaro-toolchain-cross-arm.do_patch"
> task-depends.dot:"external-linaro-toolchain-cross-arm.do_populate_sysroot"
> [label="external-linaro-toolchain-cross-arm
> do_populate_sysroot\n:1.0-r1\n/home/nws/yocto-morty-dev/sources/meta-arago/meta-arago-extras/recipes-core/meta/external-linaro-toolchain-cross.bb"]
> task-depends.dot:"external-linaro-toolchain-cross-arm.do_populate_sysroot"
> -> "external-linaro-toolchain-cross-arm.do_install"
> task-depends.dot:"external-linaro-toolchain.do_create_srcipk" ->
> "external-linaro-toolchain-cross-arm.do_patch"
> task-depends.dot:"tisdk-rootfs-image.do_rootfs" ->
> "external-linaro-toolchain-cross-arm.do_populate_lic"
> task-depends.dot:"external-linaro-toolchain-cross-arm.do_build"
> [label="external-linaro-toolchain-cross-arm
> do_build\n:1.0-r1\n/home/nws/yocto-morty-dev/sources/meta-arago/meta-arago-extras/recipes-core/meta/external-linaro-toolchain-cross.bb"]
> task-depends.dot:"external-linaro-toolchain-cross-arm.do_build" ->
> "external-linaro-toolchain-cross-arm.do_populate_lic"
> task-depends.dot:"external-linaro-toolchain-cross-arm.do_build" ->
> "external-linaro-toolchain-cross-arm.do_populate_sysroot"
> task-depends.dot:"tisdk-rootfs-image.do_build" ->
> "external-linaro-toolchain-cross-arm.do_build"
> task-depends.dot:"tisdk-rootfs-image.do_image" ->
> "external-linaro-toolchain-cross-arm.do_populate_lic"
> task-depends.dot:"external-linaro-toolchain-cross-arm.do_create_srcipk"
> [label="external-linaro-toolchain-cross-arm
> do_create_srcipk\n:1.0-r1\n/home/nws/yocto-morty-dev/sources/meta-arago/meta-arago-extras/recipes-core/meta/external-linaro-toolchain-cross.bb"]
> task-depends.dot:"external-linaro-toolchain-cross-arm.do_create_srcipk"
> -> "external-linaro-toolchain-cross-arm.do_patch"
> task-depends.dot:"external-linaro-toolchain-cross-arm.do_patch"
> [label="external-linaro-toolchain-cross-arm
> do_patch\n:1.0-r1\n/home/nws/yocto-morty-dev/sources/meta-arago/meta-arago-extras/recipes-core/meta/external-linaro-toolchain-cross.bb"]
> task-depends.dot:"external-linaro-toolchain-cross-arm.do_patch" ->
> "quilt-native.do_populate_sysroot"
> task-depends.dot:"external-linaro-toolchain-cross-arm.do_patch" ->
> "external-linaro-toolchain-cross-arm.do_unpack"
>
> On Tue, Feb 7, 2017 at 4:00 AM, Denys Dmytriyenko <denys@ti.com> wrote:
>> On Mon, Feb 06, 2017 at 10:03:28PM +1300, Ankur Tyagi wrote:
>>> Hi,
>>>
>>> I am getting following error when trying to bitbake tisdk-rootfs-image
>>> on morty branch
>>>
>>> http://pastebin.com/RYjxsNXa
>>>
>>> This is my build configuration:
>>>
>>> Build Configuration:
>>> BB_VERSION        = "1.32.0"
>>> BUILD_SYS         = "x86_64-linux"
>>> NATIVELSBSTRING   = "Ubuntu-16.04"
>>> TARGET_SYS        = "arm-linux-gnueabi"
>>> MACHINE           = "am335x-evm"
>>> DISTRO            = "arago"
>>> DISTRO_VERSION    = "2017.01"
>>> TUNE_FEATURES     = "arm armv7a vfp thumb neon       callconvention-hard"
>>> TARGET_FPU        = "hard"
>>> meta-arago-distro
>>> meta-arago-extras = "morty:6b2b36c1438b60388f56ce4e37771d6faf1dade8"
>>> meta-qt5          = "morty:4020adfd5198cf581eb20fbfd7d5b4c1a42fcdf4"
>>> meta-networking
>>> meta-ruby
>>> meta-python
>>> meta-oe           = "morty:1efa5d623bc64659b57389e50be2568b1355d5f7"
>>> meta-ti           = "morty:935753e93814a75db2072e5d1b31b759f835e95c"
>>> meta-linaro-toolchain
>>> meta-optee        = "morty:d4639deb43bb6c62ac06aaf951245edc9b9f410e"
>>> meta              = "morty:79f821fb6c1b425ca5cb5e6db360c2743d6c989e"
>>
>> Can you check if external-linaro-toolchain-cross in your dependency tree:
>>
>> $ bitbake tisdk-rootfs-image -g
>> $ grep external-linaro-toolchain-cross *.dot
>>
>> --
>> Denys

