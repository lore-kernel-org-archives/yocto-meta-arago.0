Return-Path: <ankur.tyagi85@gmail.com>
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com
	[209.85.208.170])
	by arago-project.org (Postfix) with ESMTPS id 4174A520DF
	for <meta-arago@arago-project.org>;
	Tue, 24 Sep 2019 13:25:20 +0000 (UTC)
Received: by mail-lj1-f170.google.com with SMTP id 7so1867588ljw.7
	for <meta-arago@arago-project.org>;
	Tue, 24 Sep 2019 06:24:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to;
	bh=ESLhysxP7rT7NEGCCNyhCffoSbuZjM+KnNACMWmVlZ4=;
	b=FTM5m3M+dkXzRif9tVQOkYMHTJxIL1PgZtNU6oBFZ4qa/SEJl3Eltyt/JP9v4GEVyl
	rtEAwboAHD14Romvsk5WWWYFvymOVf0oDO/XWl0JBaI6K3bMte7GgNvxku52QQxsleWX
	cyRbX7DV0IlswsGOl7thX3+WQw6Pf47gpmYV5A/K5kYQeFemU9bwB663Hgn/peYfTPYR
	yqBfFc0eWjR/0kOM4Kzlb/+eERELBBDZ7Xu5L3+oM9SRp6zt8wXosp7Fr9v3/ZdoBGJ6
	Reh+m9udTzMFLIHQtW9FiKEUf5RVnaU7IP7BxzqwSLdNRozKGN62dSGwPOsSABsTwIqh
	9EEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=ESLhysxP7rT7NEGCCNyhCffoSbuZjM+KnNACMWmVlZ4=;
	b=bPftGTh95mdYvv5Cay0r20YYv6kc8Hqa22BDIsDhCxJMzWuF+wd0rd/7/XXFova8R2
	qIG0KRI/rMh8tPJjEgtNdfSQ9kgfTL7bJvd+zORdBTkIwGWOdlgoz51SzMgqVC2OQbMy
	NsmSBHppvX53SJrhmGnbugwnjomO3dmJpLbwD4yr3cE+LelYoHKSl4ViZwX3HThK69f8
	ly/+EmUZqxUinASxG4e5XR9Tk2wLtkuvtTnDXQ3Hzzqurt3p3Yiwbdq60y8urGTlig3A
	OxaNFrfTvufYgL1mZQrVPuMCfmx8D7vc6A2RrMNg+NOwzXi1+E8gNMyRBc6Ce+3PblfO
	wsdA==
X-Gm-Message-State: APjAAAX6ZJzSvPsh/J2vAvdOHGjvtYYZhCpuUgh0Vy4b94aLR7pmTDCO
	CB1DQUBJEmTghxa+XXstNqNI5qRpXb0bNQoNRjA9jImi
X-Google-Smtp-Source: APXvYqwAN99ijjkqhiuyXyJpS9JvGkYQgDvEmUrNpWUQhhiYsiRaZaLyFtMId+5b+HGXwesu7sXKaYb/yh11pp59dq4=
X-Received: by 2002:a2e:5358:: with SMTP id t24mr1997342ljd.209.1569331449829; 
	Tue, 24 Sep 2019 06:24:09 -0700 (PDT)
MIME-Version: 1.0
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
Date: Wed, 25 Sep 2019 01:23:58 +1200
Message-ID: <CADySD0HyRLzXfSfcYTrGZmuX2acoCMi2BE+hy=v+-fKPAvF3Mw@mail.gmail.com>
To: meta-arago@arago-project.org
Subject: do_rootfs error for custom image based upon arago thud branch
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
X-List-Received-Date: Tue, 24 Sep 2019 13:25:20 -0000
Content-Type: text/plain; charset="UTF-8"

Hi,

I was using "thud" branch to create custom image for my board.
Recently updated meta-ti, meta-arago "thud" branch and started
receiving following error message during do_rootfs task

ERROR: ggl-wsl-prod-image-1.0-r0 do_rootfs: Unable to install
packages. Command
'/home/yocto/ggl-yocto-tools/build/tmp-external-arm-toolchain/work/wsl-linux-gnueabi/ggl-wsl-prod-image/1.0-r0/recipe-sysroot-native/usr/bin/opkg
--volatile-cache -f
/home/yocto/ggl-yocto-tools/build/tmp-external-arm-toolchain/work/wsl-linux-gnueabi/ggl-wsl-prod-image/1.0-r0/opkg.conf
-t /home/yocto/ggl-yocto-tools/build/tmp-external-arm-toolchain/work/wsl-linux-gnueabi/ggl-wsl-prod-image/1.0-r0/temp/ipktemp/
-o /home/yocto/ggl-yocto-tools/build/tmp-external-arm-toolchain/work/wsl-linux-gnueabi/ggl-wsl-prod-image/1.0-r0/rootfs
 --force_postinstall    install packagegroup-core-boot
packagegroup-ggl-base packagegroup-ggl-connectivity
packagegroup-ggl-qt psplash run-postinsts' returned 2:
Collected errors:
 * Solver encountered 2 problem(s):
 * Problem 1/2:
 *   - nothing provides u-boot-ti-staging-src >=
2019.01+git0+571bb85860 needed by
linux-ti-staging-src-4.19.73+git0+761ba629e9-gamos.wsl
 *
 * Solution 1:
 *   - do not ask to install a package providing packagegroup-ggl-base

 * Problem 2/2:
 *   - nothing provides u-boot-ti-staging-src >=
2019.01+git0+571bb85860 needed by
linux-ti-staging-src-4.19.73+git0+761ba629e9-gamos.wsl
 *
 * Solution 1:
 *   - do not ask to install a package providing packagegroup-ggl-qt

 * opkg_finalize_intercepts: Failed to open dir
/home/yocto/ggl-yocto-tools/build/tmp-external-arm-toolchain/work/wsl-linux-gnueabi/ggl-wsl-prod-image/1.0-r0/temp/ipktemp//opkg-JLB910/opkg-intercept-xOvXqH:
No such file or directory.
 * rm_r: Failed to open dir
/home/yocto/ggl-yocto-tools/build/tmp-external-arm-toolchain/work/wsl-linux-gnueabi/ggl-wsl-prod-image/1.0-r0/temp/ipktemp//opkg-JLB910/opkg-intercept-xOvXqH:
No such file or directory.
 * rm_r: Failed to open dir
/home/yocto/ggl-yocto-tools/build/tmp-external-arm-toolchain/work/wsl-linux-gnueabi/ggl-wsl-prod-image/1.0-r0/temp/ipktemp//opkg-JLB910:
No such file or directory.



ERROR: ggl-wsl-prod-image-1.0-r0 do_rootfs: Function failed: do_rootfs
ERROR: Logfile of failure stored in:
/home/yocto/ggl-yocto-tools/build/tmp-external-arm-toolchain/work/wsl-linux-gnueabi/ggl-wsl-prod-image/1.0-r0/temp/log.do_rootfs.107554
ERROR: Task (/home/yocto/ggl-yocto-tools/sources/ggl-yocto/meta-ggl-image/recipes-core/images/ggl-wsl-prod-image.bb:do_rootfs)
failed with exit code '1'

Can you please help:
1) to understand the underlying problem
2) how can I fix it

thanks
Ankur

