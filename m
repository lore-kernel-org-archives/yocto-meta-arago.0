Return-Path: <ankur.tyagi85@gmail.com>
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com
	[209.85.208.175])
	by arago-project.org (Postfix) with ESMTPS id B7CFF520E2
	for <meta-arago@arago-project.org>;
	Wed, 25 Sep 2019 19:18:48 +0000 (UTC)
Received: by mail-lj1-f175.google.com with SMTP id j19so6885169lja.1
	for <meta-arago@arago-project.org>;
	Wed, 25 Sep 2019 12:17:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to; 
	bh=JNYlgAT9SGhtbxNV22qadlSGYt4vmnyHZdStZsWx4nQ=;
	b=LPPPgHu5vPpzRPRlhgXyyPCHayi7XlooCqFQPtTAM6dh4TTSHSzJVUqqm6PapTIQ/y
	PRXM/qngRx/o9YZ8ciKGiu0syAp+SQP01vIRsSUbc0zwXz1UPEzqFQlhIfkGAehCy1O7
	o5dJA1t0lC9+Ls19wKvzhUeOkj0dVqfjWmMrfV/trYacDyHNRVxL8bFg1siBURK9BMYl
	hFArljTTvvuCbgUmhwizQWwq5MtE7O2YYvEeVupp4ahFVS3iEAFGS9L5Ti8/eSb+4j9S
	socqclpN+N5/j3Vw5X8WpperPoS9jR8GQnXlV0n0UKHc1VBC8OimsFYLqs4j5pYlxEh0
	/svg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to;
	bh=JNYlgAT9SGhtbxNV22qadlSGYt4vmnyHZdStZsWx4nQ=;
	b=od7K5yicGIZYoOcFZtsT76fp4r+/gUDA+emQ2CxCLguG2cVCyO5uBs3HUrBpCKKHwH
	lsXbvGfU5H9ZY9dwHnU1iskz1CnysT75u0k6ONB6/hX4XFRbhIV8HyMq+X4GwxkspDd1
	iFc8yEs6Q1S396JnHljror2MlHtBgwpdDcdsockHMgyIKr4n40H9R3yruzrpvOu3GUPF
	e3ZyhCBc7aqp1wdO4p32Dfr88SWN3Vpo8ujUw4+ziFEeYW3JxjmVnkr6FbbbuAJac2un
	W11mF5vdH/Ta81PazeWn6xKicdacAAOiJ/AIWPz9oRA2+5JnNe5p6GF1Ovvf0XUSumr9
	y30Q==
X-Gm-Message-State: APjAAAWol0V5/azR2v6ffTgyq9LtHSmOwNCHl9er4+nse+D34eYBy8QL
	s/oYTsIG7krNMJqmptE4KpAYMfO0h8b+Y4atZSEW9g==
X-Google-Smtp-Source: APXvYqz66PsGeIHBzhTwtT1mzvjqALCtN9Q0H3s0AngX2amkJLC/CsogKjzGpbC1ovDrxcYkO0xCdwMfraOMTl2FSZ4=
X-Received: by 2002:a2e:91c7:: with SMTP id u7mr7523749ljg.146.1569439057791; 
	Wed, 25 Sep 2019 12:17:37 -0700 (PDT)
MIME-Version: 1.0
References: <CADySD0HyRLzXfSfcYTrGZmuX2acoCMi2BE+hy=v+-fKPAvF3Mw@mail.gmail.com>
In-Reply-To: <CADySD0HyRLzXfSfcYTrGZmuX2acoCMi2BE+hy=v+-fKPAvF3Mw@mail.gmail.com>
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
Date: Thu, 26 Sep 2019 07:17:26 +1200
Message-ID: <CADySD0HKK1MWGXg2qL4PP-SRiyrHGJUpwKgAuCTVsZ0MizCSpg@mail.gmail.com>
To: meta-arago@arago-project.org
Subject: Re: do_rootfs error for custom image based upon arago thud branch
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
X-List-Received-Date: Wed, 25 Sep 2019 19:18:49 -0000
Content-Type: multipart/alternative; boundary="000000000000894e08059365815c"

--000000000000894e08059365815c
Content-Type: text/plain; charset="UTF-8"

It got resolved after removing tmp directory and rebuilding

On Wed, 25 Sep 2019, 1:23 a.m. Ankur Tyagi, <ankur.tyagi85@gmail.com> wrote:

> Hi,
>
> I was using "thud" branch to create custom image for my board.
> Recently updated meta-ti, meta-arago "thud" branch and started
> receiving following error message during do_rootfs task
>
> ERROR: ggl-wsl-prod-image-1.0-r0 do_rootfs: Unable to install
> packages. Command
>
> '/home/yocto/ggl-yocto-tools/build/tmp-external-arm-toolchain/work/wsl-linux-gnueabi/ggl-wsl-prod-image/1.0-r0/recipe-sysroot-native/usr/bin/opkg
> --volatile-cache -f
>
> /home/yocto/ggl-yocto-tools/build/tmp-external-arm-toolchain/work/wsl-linux-gnueabi/ggl-wsl-prod-image/1.0-r0/opkg.conf
> -t
> /home/yocto/ggl-yocto-tools/build/tmp-external-arm-toolchain/work/wsl-linux-gnueabi/ggl-wsl-prod-image/1.0-r0/temp/ipktemp/
> -o
> /home/yocto/ggl-yocto-tools/build/tmp-external-arm-toolchain/work/wsl-linux-gnueabi/ggl-wsl-prod-image/1.0-r0/rootfs
>  --force_postinstall    install packagegroup-core-boot
> packagegroup-ggl-base packagegroup-ggl-connectivity
> packagegroup-ggl-qt psplash run-postinsts' returned 2:
> Collected errors:
>  * Solver encountered 2 problem(s):
>  * Problem 1/2:
>  *   - nothing provides u-boot-ti-staging-src >=
> 2019.01+git0+571bb85860 needed by
> linux-ti-staging-src-4.19.73+git0+761ba629e9-gamos.wsl
>  *
>  * Solution 1:
>  *   - do not ask to install a package providing packagegroup-ggl-base
>
>  * Problem 2/2:
>  *   - nothing provides u-boot-ti-staging-src >=
> 2019.01+git0+571bb85860 needed by
> linux-ti-staging-src-4.19.73+git0+761ba629e9-gamos.wsl
>  *
>  * Solution 1:
>  *   - do not ask to install a package providing packagegroup-ggl-qt
>
>  * opkg_finalize_intercepts: Failed to open dir
>
> /home/yocto/ggl-yocto-tools/build/tmp-external-arm-toolchain/work/wsl-linux-gnueabi/ggl-wsl-prod-image/1.0-r0/temp/ipktemp//opkg-JLB910/opkg-intercept-xOvXqH:
> No such file or directory.
>  * rm_r: Failed to open dir
>
> /home/yocto/ggl-yocto-tools/build/tmp-external-arm-toolchain/work/wsl-linux-gnueabi/ggl-wsl-prod-image/1.0-r0/temp/ipktemp//opkg-JLB910/opkg-intercept-xOvXqH:
> No such file or directory.
>  * rm_r: Failed to open dir
>
> /home/yocto/ggl-yocto-tools/build/tmp-external-arm-toolchain/work/wsl-linux-gnueabi/ggl-wsl-prod-image/1.0-r0/temp/ipktemp//opkg-JLB910:
> No such file or directory.
>
>
>
> ERROR: ggl-wsl-prod-image-1.0-r0 do_rootfs: Function failed: do_rootfs
> ERROR: Logfile of failure stored in:
>
> /home/yocto/ggl-yocto-tools/build/tmp-external-arm-toolchain/work/wsl-linux-gnueabi/ggl-wsl-prod-image/1.0-r0/temp/log.do_rootfs.107554
> ERROR: Task
> (/home/yocto/ggl-yocto-tools/sources/ggl-yocto/meta-ggl-image/recipes-core/images/ggl-wsl-prod-image.bb:
> do_rootfs)
> failed with exit code '1'
>
> Can you please help:
> 1) to understand the underlying problem
> 2) how can I fix it
>
> thanks
> Ankur
>

--000000000000894e08059365815c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">It got resolved after removing tmp directory and rebuildi=
ng</div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr=
">On Wed, 25 Sep 2019, 1:23 a.m. Ankur Tyagi, &lt;<a href=3D"mailto:ankur.t=
yagi85@gmail.com">ankur.tyagi85@gmail.com</a>&gt; wrote:<br></div><blockquo=
te class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc so=
lid;padding-left:1ex">Hi,<br>
<br>
I was using &quot;thud&quot; branch to create custom image for my board.<br=
>
Recently updated meta-ti, meta-arago &quot;thud&quot; branch and started<br=
>
receiving following error message during do_rootfs task<br>
<br>
ERROR: ggl-wsl-prod-image-1.0-r0 do_rootfs: Unable to install<br>
packages. Command<br>
&#39;/home/yocto/ggl-yocto-tools/build/tmp-external-arm-toolchain/work/wsl-=
linux-gnueabi/ggl-wsl-prod-image/1.0-r0/recipe-sysroot-native/usr/bin/opkg<=
br>
--volatile-cache -f<br>
/home/yocto/ggl-yocto-tools/build/tmp-external-arm-toolchain/work/wsl-linux=
-gnueabi/ggl-wsl-prod-image/1.0-r0/opkg.conf<br>
-t /home/yocto/ggl-yocto-tools/build/tmp-external-arm-toolchain/work/wsl-li=
nux-gnueabi/ggl-wsl-prod-image/1.0-r0/temp/ipktemp/<br>
-o /home/yocto/ggl-yocto-tools/build/tmp-external-arm-toolchain/work/wsl-li=
nux-gnueabi/ggl-wsl-prod-image/1.0-r0/rootfs<br>
=C2=A0--force_postinstall=C2=A0 =C2=A0 install packagegroup-core-boot<br>
packagegroup-ggl-base packagegroup-ggl-connectivity<br>
packagegroup-ggl-qt psplash run-postinsts&#39; returned 2:<br>
Collected errors:<br>
=C2=A0* Solver encountered 2 problem(s):<br>
=C2=A0* Problem 1/2:<br>
=C2=A0*=C2=A0 =C2=A0- nothing provides u-boot-ti-staging-src &gt;=3D<br>
2019.01+git0+571bb85860 needed by<br>
linux-ti-staging-src-4.19.73+git0+761ba629e9-gamos.wsl<br>
=C2=A0*<br>
=C2=A0* Solution 1:<br>
=C2=A0*=C2=A0 =C2=A0- do not ask to install a package providing packagegrou=
p-ggl-base<br>
<br>
=C2=A0* Problem 2/2:<br>
=C2=A0*=C2=A0 =C2=A0- nothing provides u-boot-ti-staging-src &gt;=3D<br>
2019.01+git0+571bb85860 needed by<br>
linux-ti-staging-src-4.19.73+git0+761ba629e9-gamos.wsl<br>
=C2=A0*<br>
=C2=A0* Solution 1:<br>
=C2=A0*=C2=A0 =C2=A0- do not ask to install a package providing packagegrou=
p-ggl-qt<br>
<br>
=C2=A0* opkg_finalize_intercepts: Failed to open dir<br>
/home/yocto/ggl-yocto-tools/build/tmp-external-arm-toolchain/work/wsl-linux=
-gnueabi/ggl-wsl-prod-image/1.0-r0/temp/ipktemp//opkg-JLB910/opkg-intercept=
-xOvXqH:<br>
No such file or directory.<br>
=C2=A0* rm_r: Failed to open dir<br>
/home/yocto/ggl-yocto-tools/build/tmp-external-arm-toolchain/work/wsl-linux=
-gnueabi/ggl-wsl-prod-image/1.0-r0/temp/ipktemp//opkg-JLB910/opkg-intercept=
-xOvXqH:<br>
No such file or directory.<br>
=C2=A0* rm_r: Failed to open dir<br>
/home/yocto/ggl-yocto-tools/build/tmp-external-arm-toolchain/work/wsl-linux=
-gnueabi/ggl-wsl-prod-image/1.0-r0/temp/ipktemp//opkg-JLB910:<br>
No such file or directory.<br>
<br>
<br>
<br>
ERROR: ggl-wsl-prod-image-1.0-r0 do_rootfs: Function failed: do_rootfs<br>
ERROR: Logfile of failure stored in:<br>
/home/yocto/ggl-yocto-tools/build/tmp-external-arm-toolchain/work/wsl-linux=
-gnueabi/ggl-wsl-prod-image/1.0-r0/temp/log.do_rootfs.107554<br>
ERROR: Task (/home/yocto/ggl-yocto-tools/sources/ggl-yocto/meta-ggl-image/r=
ecipes-core/images/ggl-wsl-prod-image.bb:do_rootfs)<br>
failed with exit code &#39;1&#39;<br>
<br>
Can you please help:<br>
1) to understand the underlying problem<br>
2) how can I fix it<br>
<br>
thanks<br>
Ankur<br>
</blockquote></div>

--000000000000894e08059365815c--
