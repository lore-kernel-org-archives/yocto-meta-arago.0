Return-Path: <ankur.tyagi85@gmail.com>
Received: from mail-yw0-f171.google.com (mail-yw0-f171.google.com
	[209.85.161.171])
	by arago-project.org (Postfix) with ESMTPS id EDFB752AD0
	for <meta-arago@arago-project.org>;
	Mon,  6 Feb 2017 09:03:48 +0000 (UTC)
Received: by mail-yw0-f171.google.com with SMTP id v200so45059637ywc.3
	for <meta-arago@arago-project.org>;
	Mon, 06 Feb 2017 01:03:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to;
	bh=t6mdJiE+szn05rW3vWGECmWx4Xgo6ls7AnL7oibRU7E=;
	b=YWQph+rhPLksMb6ukaxJzrCi7s+9ad4Ku94AGShw5JdXsEDSlCXPyTco+FZaeKZ+63
	NTREOOPnVmkz0qWco27Q7MQn9uHlIk4Z69GRy89BC71GA8p3CpPwEk1nufdAOy3KpmxQ
	LqiMxwR0nW52dY76/A8vt/4qNsPrYzu+pkEczCj90aulKf3F7Q3vqK+XYIMBpMTEAKWs
	AW3ciAu4M5tQ/dL574CyAe+0LP3qPzhal9UsD2YXL9WwZ3QRm3XA08M7OKP2NzOV3RLo
	1rzoyhsR9pIGLJFXEZpR4xlh7IUa6eIuVcoLdbJFgbkcelMHG8R7dRkCwyysN8SPiPlf
	ucBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=t6mdJiE+szn05rW3vWGECmWx4Xgo6ls7AnL7oibRU7E=;
	b=sE1yebe7sgUFv/tcoYhTlVd1CYceXJkK3jxZiWZEq9OUdb3c6phyjWO8P4ZiIJ6vm4
	sMHz8/slfdmM/qNDPA97Wmn47OywrItULKribbDTqDpClDT0e1mQ0okCsWsGm9sjI7ck
	L+p/T8BGbL6/9ts/0BTiBczhn8/iHOhw7Ng1mBjBPK5Dz2C9jkjIdu/lHO+D/yaLR8wu
	il+tlrNGISdeAmyBhy9C8nl0n1x3mVjx0HacdaLsaSGpddKff7Tt3jSqLvmDVJu+snLM
	YhCavJsaAYF+fJUuWsbnpNniQYfUOf/ZJDrvef6Adid0NAQy5qLZGTAMNfrzvoUyj8vd
	gk4A==
X-Gm-Message-State: AMke39mRVF5e/4VYkOtDWYjkbOycF7D2suQcmJpj7nzQr0yp6lZdh8fnGxuJx+bGaC+ygNfhvuNsjjbcl+bGnA==
X-Received: by 10.13.248.198 with SMTP id i189mr6172915ywf.274.1486371828708; 
	Mon, 06 Feb 2017 01:03:48 -0800 (PST)
MIME-Version: 1.0
Received: by 10.129.80.215 with HTTP; Mon, 6 Feb 2017 01:03:28 -0800 (PST)
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
Date: Mon, 6 Feb 2017 22:03:28 +1300
Message-ID: <CADySD0GYzbgy90bbYg-Gvz+xS963pEOd0qUExa8TkHGC39U4cg@mail.gmail.com>
To: meta-arago@arago-project.org
Subject: tisdk-rootfs-image recipe bitbake error on morty branch
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
X-List-Received-Date: Mon, 06 Feb 2017 09:03:49 -0000
Content-Type: text/plain; charset=UTF-8

Hi,

I am getting following error when trying to bitbake tisdk-rootfs-image
on morty branch

http://pastebin.com/RYjxsNXa

This is my build configuration:

Build Configuration:
BB_VERSION        = "1.32.0"
BUILD_SYS         = "x86_64-linux"
NATIVELSBSTRING   = "Ubuntu-16.04"
TARGET_SYS        = "arm-linux-gnueabi"
MACHINE           = "am335x-evm"
DISTRO            = "arago"
DISTRO_VERSION    = "2017.01"
TUNE_FEATURES     = "arm armv7a vfp thumb neon       callconvention-hard"
TARGET_FPU        = "hard"
meta-arago-distro
meta-arago-extras = "morty:6b2b36c1438b60388f56ce4e37771d6faf1dade8"
meta-qt5          = "morty:4020adfd5198cf581eb20fbfd7d5b4c1a42fcdf4"
meta-networking
meta-ruby
meta-python
meta-oe           = "morty:1efa5d623bc64659b57389e50be2568b1355d5f7"
meta-ti           = "morty:935753e93814a75db2072e5d1b31b759f835e95c"
meta-linaro-toolchain
meta-optee        = "morty:d4639deb43bb6c62ac06aaf951245edc9b9f410e"
meta              = "morty:79f821fb6c1b425ca5cb5e6db360c2743d6c989e"

Regards
Ankur

