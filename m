Return-Path: <ankur.tyagi85@gmail.com>
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com
	[209.85.167.54])
	by arago-project.org (Postfix) with ESMTPS id 7BAD15297E
	for <meta-arago@arago-project.org>;
	Sun,  4 Aug 2019 00:59:56 +0000 (UTC)
Received: by mail-lf1-f54.google.com with SMTP id p197so55387790lfa.2
	for <meta-arago@arago-project.org>;
	Sat, 03 Aug 2019 17:59:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to;
	bh=MTAoxK+SvTmHjxCpjnokRBTn8CIxZBZSVWlSPkwYDp0=;
	b=OcrS0Hh9Po9udzKUeXDkYYHstZCTpxsOh7TNj9tGIKuBb/Z1IYKqpaLinxC93xkpEz
	xu0/Gu9obJdhgaP5L3CiNHE+duwJ4qWDPITj1JWYJZDAG1hkdGmEWhqNuSI/6P0vSHU+
	vYhyeyHaWjw0EhO6wLvVxR/jJWgm7i73ChjYyBSBXj3FAkKb+G99gCgQdM/TTDgIbLEm
	6n3QBivxPb9NJf7u/XyFTmzLYmDmihsc7095lgISdfAHt9PULOTwNiV2ZQRZi8fG4fp9
	wwRlr4XcfmGg+KyeQIkiv/6JNvLCYc3QmR23+5uCJq8Lf8XLBO23mWt1IhlmabghosDa
	fTOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=MTAoxK+SvTmHjxCpjnokRBTn8CIxZBZSVWlSPkwYDp0=;
	b=Ldfkyk+b2M3L/YzDF4Ix05f/WGbtTMgUn4FI6EeiWFVdA4uX2tc2HWAFlz8PqEUS8z
	8XRxKhumKVfkZSYVhq8NUghn++OND2vAeOEDk5lx26VNzgY8u/qb/xc0crMVl9W5FgyP
	MpN0DJakLeSQao3/KT0v2ZdryBUSqKV+C6kxTj8q4St2Tv6JssGDREsmWMOhr2Z31F0+
	i3KuhoinlYyS9Aqbejx3kCKLCE3dX6sAI6vtJnTfYQsZhMIZ5VZMlus5Oprr4u6+CkI6
	08XvYbMk59CwD5ekCl10+ugGLgAJ3fwriROctgwiqoKsWQl6nrtaJ6eS9O+m8dPQqPq2
	/j/w==
X-Gm-Message-State: APjAAAX7KstmQmqRh9A6x59vL0LrkyRBmT7o9/i05st8zrUukHLg025r
	4bU/qecViI+itHgDd2tVXNqCeViBJQQvdUARxAMFQ0LW
X-Google-Smtp-Source: APXvYqyuatmQ2Mwgi1zXTwpUgr4UbTpgQKaFo9c32ChDyw6EBMwb7k0V2xAjEMRxh133YKtEHjwgdyA3tv+G6Unfwe4=
X-Received: by 2002:a19:2297:: with SMTP id i145mr66934508lfi.97.1564880339887;
	Sat, 03 Aug 2019 17:58:59 -0700 (PDT)
MIME-Version: 1.0
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
Date: Sun, 4 Aug 2019 12:58:48 +1200
Message-ID: <CADySD0Hx78etbUEEQJJuNScZU9hp1gHDoxyX_pKiJZt5O-DkWQ@mail.gmail.com>
To: meta-arago@arago-project.org
Subject: wpa-supplicant and hostap depends on openssl10
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
X-List-Received-Date: Sun, 04 Aug 2019 00:59:57 -0000
Content-Type: text/plain; charset="UTF-8"

Hi,

When building eSDK for arago based image, I am getting following error:

"The file /usr/include/openssl/comp.h is installed by both openssl10
and openssl, aborting"

I checked who depends on openssl10 and only meta-arago wpa-supplicant,
hostap depends whereas upstream depends on openssl.

Below commits show the change to depend on openssl10:

commit bc88360b: wpa-supplicant: inherit pkgconfig and depend on openssl10
commit 8c3e159b: hostap: inherit pkgconfig and depend on openssl10

Any specific reason to still depend on openssl10?

Thanks
Ankur

