Return-Path: <denys@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id DCBE952A4C
	for <meta-arago@arago-project.org>;
	Tue, 17 Dec 2013 16:03:15 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id rBHG3EnO030553
	for <meta-arago@arago-project.org>; Tue, 17 Dec 2013 10:03:14 -0600
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id rBHG3ELs008917
	for <meta-arago@arago-project.org>; Tue, 17 Dec 2013 10:03:14 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.2.342.3;
	Tue, 17 Dec 2013 10:03:13 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id rBHG3DDa031235;
	Tue, 17 Dec 2013 10:03:14 -0600
Date: Tue, 17 Dec 2013 11:03:13 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: "Srinivasan, Nageswari" <nageswari@ti.com>
Message-ID: <20131217160313.GM24180@edge>
References: <464859D4BE03A84686BA47749242C1D03EFC7103@DBDE04.ent.ti.com>
MIME-Version: 1.0
In-Reply-To: <464859D4BE03A84686BA47749242C1D03EFC7103@DBDE04.ent.ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: Build error with Crypto drivers
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
X-List-Received-Date: Tue, 17 Dec 2013 16:03:17 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Nageswari,

I noticed your build fails with openssl version ending with -arago6, which is 
the one before my recent cryptodev modifications. Can you please try a clean 
build.

The latest version of openssl bbappend in meta-arago is now -arago8 and it 
contains cryptodev changes to enable HW acceleration on supported platforms. 
You may want to pull it in for am437x, but that change shoulnd be the one 
causing the breakage, as you appear not to use it yet.

-- 
Denys


On Tue, Dec 17, 2013 at 08:13:33AM +0000, Srinivasan, Nageswari wrote:
> Hi,
> I am building EPOS SDK after rebasing to latest sources from Dylan branch (meta-ti) and meta-arago (2013.12) and facing below issues.
> Is this a known issue and any pointers to resolve this.
> 
> 
> WARNING: QA Issue: ELF binary '/db/swcoe_epos2/a0393278/oe-layersetup/build/arago-tmp-external-linaro-toolchain/work/cortexa9hf-vfp-neon-3.8-oe-linux-gnueabi/x264/r22git-r1/packages-split/x264/usr/lib/libx264.so.129' has relocations in .text
> WARNING: QA Issue: ELF binary '/db/swcoe_epos2/a0393278/oe-layersetup/build/arago-tmp-external-linaro-toolchain/work/cortexa9hf-vfp-neon-3.8-oe-linux-gnueabi/libav/0.+gitAUTOINC+2c8ce46250ff78191fe6565876ddc4bc03fdf519-r8.0-arago1/packages-split/libavcodec/usr/lib/libavcodec.so.53.35.0' has relocations in .text
> WARNING: The recipe quota is trying to install files into a shared area when those files already exist. Those files and their manifest location are:
>    /db/swcoe_epos2/a0393278/oe-layersetup/build/arago-tmp-external-linaro-toolchain/sysroots/am438x-epos-evm/usr/include/rpcsvc/rquota.h
>    Matched in manifest-am438x-epos-evm-external-linaro-toolchain
>    /db/swcoe_epos2/a0393278/oe-layersetup/build/arago-tmp-external-linaro-toolchain/sysroots/am438x-epos-evm/usr/include/rpcsvc/rquota.x
>    Matched in manifest-am438x-epos-evm-external-linaro-toolchain
> Please verify which package should provide the above files.
> WARNING: QA Issue: No GNU_HASH in the elf binary: '/db/swcoe_epos2/a0393278/oe-layersetup/build/arago-tmp-external-linaro-toolchain/work/cortexa9hf-vfp-neon-3.8-oe-li-gnueabi/python/2.7.3-r0.3/packages-split/python-audio/usr/lib/python2.7/lib-dynload/ossaudiodev.so'
> WARNING: QA Issue: No GNU_HASH in the elf binary: '/db/swcoe_epos2/a0393278/oe-layersetup/build/arago-tmp-external-linaro-toolchain/work/cortexa9hf-vfp-neon-3.8-oe-li-gnueabi/python/2.7.3-r0.3/packages-split/python-audio/usr/lib/python2.7/lib-dynload/audioop.so'
> WARNING: QA Issue: No GNU_HASH in the elf binary: '/db/swcoe_epos2/a0393278/oe-layersetup/build/arago-tmp-external-linaro-toolchain/work/cortexa9hf-vfp-neon-3.8-oe-li-gnueabi/python/2.7.3-r0.3/packages-split/python-bsddb/usr/lib/python2.7/lib-dynload/_bsddb.so'
> WARNING: QA Issue: No GNU_HASH in the elf binary: '/db/swcoe_epos2/a0393278/oe-layersetup/build/arago-tmp-external-linaro-toolchain/work/cortexa9hf-vfp-neon-3.8-oe-li-gnueabi/python/2.7.3-r0.3/packages-split/python-codecs/usr/lib/python2.7/lib-dynload/_locale.so'
> WARNING: QA Issue: No GNU_HASH in the elf binary: '/db/swcoe_epos2/a0393278/oe-layersetup/build/arago-tmp-external-linaro-toolchain/work/cortexa9hf-vfp-neon-3.8-oe-li-gnueabi/python/2.7.3-r0.3/packages-split/python-codecs/usr/lib/python2.7/lib-dynload/_multibytecodec.so'
> WARNING: QA Issue: No GNU_HASH in the elf binary: '/db/swcoe_epos2/a0393278/oe-layersetup/build/arago-tmp-external-linaro-toolchain/work/cortexa9hf-vfp-neon-3.8-oe-li-gnueabi/python/2.7.3-r0.3/packages-split/python-codecs/usr/lib/python2.7/lib-dynload/unicodedata.so'
> WARNING: QA Issue: No GNU_HASH in the elf binary: '/db/swcoe_epos2/a0393278/oe-layersetup/build/arago-tmp-external-linaro-toolchain/work/cortexa9hf-vfp-neon-3.8-oe-li-gnueabi/python/2.7.3-r0.3/packages-split/python-codecs/usr/lib/python2.7/lib-dynload/_codecs_kr.so'
> WARNING: QA Issue: No GNU_HASH in the elf binary: '/db/swcoe_epos2/a0393278/oe-layersetup/build/arago-tmp-external-linaro-toolchain/work/cortexa9hf-vfp-neon-3.8-oe-li-gnueabi/python/2.7.3-r0.3/packages-split/python-codecs/usr/lib/python2.7/lib-dynload/_codecs_jp.so'
> WARNING: QA Issue: No GNU_HASH in the elf binary: '/db/swcoe_epos2/a0393278/oe-layersetup/build/arago-tmp-external-linaro-toolchain/work/cortexa9hf-vfp-neon-3.8-oe-li-gnueabi/python/2.7.3-r0.3/packages-split/python-codecs/usr/lib/python2.7/lib-dynload/_codecs_cn.so'
> WARNING: QA Issue: No GNU_HASH in the elf binary: '/db/swcoe_epos2/a0393278/oe-layersetup/build/arago-tmp-external-linaro-toolchain/work/cortexa9hf-vfp-neon-3.8-oe-li-gnueabi/python/2.7.3-r0.3/packages-split/python-codecs/usr/lib/python2.7/lib-dynload/_codecs_tw.so'
> WARNING: QA Issue: No GNU_HASH in the elf binary: '/db/swcoe_epos2/a0393278/oe-layersetup/build/arago-tmp-external-linaro-toolchain/work/cortexa9hf-vfp-neon-3.8-oe-li-gnueabi/python/2.7.3-r0.3/packages-split/python-codecs/usr/lib/python2.7/lib-dynload/_codecs_hk.so'
> WARNING: QA Issue: No GNU_HASH in the elf binary: '/db/swcoe_epos2/a0393278/oe-layersetup/build/arago-tmp-external-linaro-toolchain/work/cortexa9hf-vfp-neon-3.8-oe-li-gnueabi/python/2.7.3-r0.3/packages-split/python-codecs/usr/lib/python2.7/lib-dynload/_codecs_iso2022.so'
> WARNING: QA Issue: No GNU_HASH in the elf binary: '/db/swcoe_epos2/a0393278/oe-layersetup/build/arago-tmp-external-linaro-toolchain/work/cortexa9hf-vfp-neon-3.8-oe-li-gnueabi/python/2.7.3-r0.3/packages-split/python-compression/usr/lib/python2.7/lib-dynload/bz2.so'
> WARNING: QA Issue: No GNU_HASH in the elf binary: '/db/swcoe_epos2/a0393278/oe-layersetup/build/arago-tmp-external-linaro-toolchain/work/cortexa9hf-vfp-neon-3.8-oe-li-gnueabi/python/2.7.3-r0.3/packages-split/python-core/usr/lib/python2.7/lib-dynload/binascii.so'
> WARNING: QA Issue: No GNU_HASH in the elf binary: '/db/swcoe_epos2/a0393278/oe-layersetup/build/arago-tmp-external-linaro-toolchain/work/cortexa9hf-vfp-neon-3.8-oe-li-gnueabi/python/2.7.3-r0.3/packages-split/python-core/usr/lib/python2.7/lib-dynload/_struct.so'
> WARNING: QA Issue: No GNU_HASH in the elf binary: '/db/swcoe_epos2/a0393278/oe-layersetup/build/arago-tmp-external-linaro-toolchain/work/cortexa9hf-vfp-neon-3.8-oe-li-gnueabi/python/2.7.3-r0.3/packages-split/python-core/usr/lib/python2.7/lib-dynload/time.so'
> WARNING: QA Issue: No GNU_HASH in the elf binary: '/db/swcoe_epos2/a0393278/oe-layersetup/build/arago-tmp-external-linaro-toolchain/work/cortexa9hf-vfp-neon-3.8-oe-li-gnueabi/python/2.7.3-r0.3/packages-split/python-crypt/usr/lib/python2.7/lib-dynload/crypt.so'
> WARNING: QA Issue: No GNU_HASH in the elf binary: '/db/swcoe_epos2/a0393278/oe-layersetup/build/arago-tmp-external-linaro-toolchain/work/cortexa9hf-vfp-neon-3.8-oe-li-gnueabi/python/2.7.3-r0.3/packages-split/python-crypt/usr/lib/python2.7/lib-dynload/_hashlib.so'
> WARNING: QA Issue: No GNU_HASH in the elf binary: '/db/swcoe_epos2/a0393278/oe-layersetup/build/arago-tmp-external-linaro-toolchain/work/cortexa9hf-vfp-neon-3.8-oe-li-gnueabi/python/2.7.3-r0.3/packages-split/python-ctypes/usr/lib/python2.7/lib-dynload/_ctypes.so'
> WARNING: QA Issue: No GNU_HASH in the elf binary: '/db/swcoe_epos2/a0393278/oe-layersetup/build/arago-tmp-external-linaro-toolchain/work/cortexa9hf-vfp-neon-3.8-oe-li-gnueabi/python/2.7.3-r0.3/packages-split/python-ctypes/usr/lib/python2.7/lib-dynload/_ctypes_test.so'
> WARNING: QA Issue: No GNU_HASH in the elf binary: '/db/swcoe_epos2/a0393278/oe-layersetup/build/arago-tmp-external-linaro-toolchain/work/cortexa9hf-vfp-neon-3.8-oe-li-gnueabi/python/2.7.3-r0.3/packages-split/python-curses/usr/lib/python2.7/lib-dynload/_curses.so'
> WARNING: QA Issue: No GNU_HASH in the elf binary: '/db/swcoe_epos2/a0393278/oe-layersetup/build/arago-tmp-external-linaro-toolchain/work/cortexa9hf-vfp-neon-3.8-oe-li-gnueabi/python/2.7.3-r0.3/packages-split/python-curses/usr/lib/python2.7/lib-dynload/_curses_panel.so'
> WARNING: QA Issue: No GNU_HASH in the elf binary: '/db/swcoe_epos2/a0393278/oe-layersetup/build/arago-tmp-external-linaro-toolchain/work/cortexa9hf-vfp-neon-3.8-oe-li-gnueabi/python/2.7.3-r0.3/packages-split/python-datetime/usr/lib/python2.7/lib-dynload/datetime.so'
> WARNING: QA Issue: No GNU_HASH in the elf binary: '/db/swcoe_epos2/a0393278/oe-layersetup/build/arago-tmp-external-linaro-toolchain/work/cortexa9hf-vfp-neon-3.8-oe-li-gnueabi/python/2.7.3-r0.3/packages-split/python-elementtree/usr/lib/python2.7/lib-dynload/_elementtree.so'
> WARNING: QA Issue: No GNU_HASH in the elf binary: '/db/swcoe_epos2/a0393278/oe-layersetup/build/arago-tmp-external-linaro-toolchain/work/cortexa9hf-vfp-neon-3.8-oe-li-gnueabi/python/2.7.3-r0.3/packages-split/python-fcntl/usr/lib/python2.7/lib-dynload/fcntl.so'
> WARNING: QA Issue: No GNU_HASH in the elf binary: '/db/swcoe_epos2/a0393278/oe-layersetup/build/arago-tmp-external-linaro-toolchain/work/cortexa9hf-vfp-neon-3.8-oe-li-gnueabi/python/2.7.3-r0.3/packages-split/python-gdbm/usr/lib/python2.7/lib-dynload/gdbm.so'
> WARNING: QA Issue: No GNU_HASH in the elf binary: '/db/swcoe_epos2/a0393278/oe-layersetup/build/arago-tmp-external-linaro-toolchain/work/cortexa9hf-vfp-neon-3.8-oe-li-gnueabi/python/2.7.3-r0.3/packages-split/python-hotshot/usr/lib/python2.7/lib-dynload/_hotshot.so'
> WARNING: QA Issue: No GNU_HASH in the elf binary: '/db/swcoe_epos2/a0393278/oe-layersetup/build/arago-tmp-external-linaro-toolchain/work/cortexa9hf-vfp-neon-3.8-oe-li-gnueabi/python/2.7.3-r0.3/packages-split/python-image/usr/lib/python2.7/lib-dynload/imageop.so'
> WARNING: QA Issue: No GNU_HASH in the elf binary: '/db/swcoe_epos2/a0393278/oe-layersetup/build/arago-tmp-external-linaro-toolchain/work/cortexa9hf-vfp-neon-3.8-oe-li-gnueabi/python/2.7.3-r0.3/packages-split/python-io/usr/lib/python2.7/lib-dynload/_socket.so'
> WARNING: QA Issue: No GNU_HASH in the elf binary: '/db/swcoe_epos2/a0393278/oe-layersetup/build/arago-tmp-external-linaro-toolchain/work/cortexa9hf-vfp-neon-3.8-oe-li-gnueabi/python/2.7.3-r0.3/packages-split/python-io/usr/lib/python2.7/lib-dynload/_io.so'
> WARNING: QA Issue: No GNU_HASH in the elf binary: '/db/swcoe_epos2/a0393278/oe-layersetup/build/arago-tmp-external-linaro-toolchain/work/cortexa9hf-vfp-neon-3.8-oe-li-gnueabi/python/2.7.3-r0.3/packages-split/python-io/usr/lib/python2.7/lib-dynload/_ssl.so'
> WARNING: QA Issue: No GNU_HASH in the elf binary: '/db/swcoe_epos2/a0393278/oe-layersetup/build/arago-tmp-external-linaro-toolchain/work/cortexa9hf-vfp-neon-3.8-oe-li-gnueabi/python/2.7.3-r0.3/packages-split/python-io/usr/lib/python2.7/lib-dynload/select.so'
> WARNING: QA Issue: No GNU_HASH in the elf binary: '/db/swcoe_epos2/a0393278/oe-layersetup/build/arago-tmp-external-linaro-toolchain/work/cortexa9hf-vfp-neon-3.8-oe-li-gnueabi/python/2.7.3-r0.3/packages-split/python-io/usr/lib/python2.7/lib-dynload/termios.so'
> WARNING: QA Issue: No GNU_HASH in the elf binary: '/db/swcoe_epos2/a0393278/oe-layersetup/build/arago-tmp-external-linaro-toolchain/work/cortexa9hf-vfp-neon-3.8-oe-li-gnueabi/python/2.7.3-r0.3/packages-split/python-io/usr/lib/python2.7/lib-dynload/cStringIO.so'
> WARNING: QA Issue: No GNU_HASH in the elf binary: '/db/swcoe_epos2/a0393278/oe-layersetup/build/arago-tmp-external-linaro-toolchain/work/cortexa9hf-vfp-neon-3.8-oe-li-gnueabi/python/2.7.3-r0.3/packages-split/python-json/usr/lib/python2.7/lib-dynload/_json.so'
> WARNING: QA Issue: No GNU_HASH in the elf binary: '/db/swcoe_epos2/a0393278/oe-layersetup/build/arago-tmp-external-linaro-toolchain/work/cortexa9hf-vfp-neon-3.8-oe-li-gnueabi/python/2.7.3-r0.3/packages-split/python-lang/usr/lib/python2.7/lib-dynload/_bisect.so'
> WARNING: QA Issue: No GNU_HASH in the elf binary: '/db/swcoe_epos2/a0393278/oe-layersetup/build/arago-tmp-external-linaro-toolchain/work/cortexa9hf-vfp-neon-3.8-oe-li-gnueabi/python/2.7.3-r0.3/packages-split/python-lang/usr/lib/python2.7/lib-dynload/_collections.so'
> WARNING: QA Issue: No GNU_HASH in the elf binary: '/db/swcoe_epos2/a0393278/oe-layersetup/build/arago-tmp-external-linaro-toolchain/work/cortexa9hf-vfp-neon-3.8-oe-li-gnueabi/python/2.7.3-r0.3/packages-split/python-lang/usr/lib/python2.7/lib-dynload/_heapq.so'
> WARNING: QA Issue: No GNU_HASH in the elf binary: '/db/swcoe_epos2/a0393278/oe-layersetup/build/arago-tmp-external-linaro-toolchain/work/cortexa9hf-vfp-neon-3.8-oe-li-gnueabi/python/2.7.3-r0.3/packages-split/python-lang/usr/lib/python2.7/lib-dynload/_functools.so'
> WARNING: QA Issue: No GNU_HASH in the elf binary: '/db/swcoe_epos2/a0393278/oe-layersetup/build/arago-tmp-external-linaro-toolchain/work/cortexa9hf-vfp-neon-3.8-oe-li-gnueabi/python/2.7.3-r0.3/packages-split/python-lang/usr/lib/python2.7/lib-dynload/array.so'
> WARNING: QA Issue: No GNU_HASH in the elf binary: '/db/swcoe_epos2/a0393278/oe-layersetup/build/arago-tmp-external-linaro-toolchain/work/cortexa9hf-vfp-neon-3.8-oe-li-gnueabi/python/2.7.3-r0.3/packages-split/python-lang/usr/lib/python2.7/lib-dynload/itertools.so'
> WARNING: QA Issue: No GNU_HASH in the elf binary: '/db/swcoe_epos2/a0393278/oe-layersetup/build/arago-tmp-external-linaro-toolchain/work/cortexa9hf-vfp-neon-3.8-oe-li-gnueabi/python/2.7.3-r0.3/packages-split/python-lang/usr/lib/python2.7/lib-dynload/operator.so'
> WARNING: QA Issue: No GNU_HASH in the elf binary: '/db/swcoe_epos2/a0393278/oe-layersetup/build/arago-tmp-external-linaro-toolchain/work/cortexa9hf-vfp-neon-3.8-oe-li-gnueabi/python/2.7.3-r0.3/packages-split/python-lang/usr/lib/python2.7/lib-dynload/parser.so'
> WARNING: QA Issue: No GNU_HASH in the elf binary: '/db/swcoe_epos2/a0393278/oe-layersetup/build/arago-tmp-external-linaro-toolchain/work/cortexa9hf-vfp-neon-3.8-oe-li-gnueabi/python/2.7.3-r0.3/packages-split/python-math/usr/lib/python2.7/lib-dynload/cmath.so'
> WARNING: QA Issue: No GNU_HASH in the elf binary: '/db/swcoe_epos2/a0393278/oe-layersetup/build/arago-tmp-external-linaro-toolchain/work/cortexa9hf-vfp-neon-3.8-oe-li-gnueabi/python/2.7.3-r0.3/packages-split/python-math/usr/lib/python2.7/lib-dynload/math.so'
> WARNING: QA Issue: No GNU_HASH in the elf binary: '/db/swcoe_epos2/a0393278/oe-layersetup/build/arago-tmp-external-linaro-toolchain/work/cortexa9hf-vfp-neon-3.8-oe-li-gnueabi/python/2.7.3-r0.3/packages-split/python-math/usr/lib/python2.7/lib-dynload/_random.so'
> WARNING: QA Issue: No GNU_HASH in the elf binary: '/db/swcoe_epos2/a0393278/oe-layersetup/build/arago-tmp-external-linaro-toolchain/work/cortexa9hf-vfp-neon-3.8-oe-li-gnueabi/python/2.7.3-r0.3/packages-split/python-mmap/usr/lib/python2.7/lib-dynload/mmap.so'
> WARNING: QA Issue: No GNU_HASH in the elf binary: '/db/swcoe_epos2/a0393278/oe-layersetup/build/arago-tmp-external-linaro-toolchain/work/cortexa9hf-vfp-neon-3.8-oe-li-gnueabi/python/2.7.3-r0.3/packages-split/python-multiprocessing/usr/lib/python2.7/lib-dynload/_multiprocessing.so'
> WARNING: QA Issue: No GNU_HASH in the elf binary: '/db/swcoe_epos2/a0393278/oe-layersetup/build/arago-tmp-external-linaro-toolchain/work/cortexa9hf-vfp-neon-3.8-oe-li-gnueabi/python/2.7.3-r0.3/packages-split/python-pickle/usr/lib/python2.7/lib-dynload/cPickle.so'
> WARNING: QA Issue: No GNU_HASH in the elf binary: '/db/swcoe_epos2/a0393278/oe-layersetup/build/arago-tmp-external-linaro-toolchain/work/cortexa9hf-vfp-neon-3.8-oe-li-gnueabi/python/2.7.3-r0.3/packages-split/python-profile/usr/lib/python2.7/lib-dynload/_lsprof.so'
> WARNING: QA Issue: No GNU_HASH in the elf binary: '/db/swcoe_epos2/a0393278/oe-layersetup/build/arago-tmp-external-linaro-toolchain/work/cortexa9hf-vfp-neon-3.8-oe-li-gnueabi/python/2.7.3-r0.3/packages-split/python-readline/usr/lib/python2.7/lib-dynload/readline.so'
> WARNING: QA Issue: No GNU_HASH in the elf binary: '/db/swcoe_epos2/a0393278/oe-layersetup/build/arago-tmp-external-linaro-toolchain/work/cortexa9hf-vfp-neon-3.8-oe-li-gnueabi/python/2.7.3-r0.3/packages-split/python-resource/usr/lib/python2.7/lib-dynload/resource.so'
> WARNING: QA Issue: No GNU_HASH in the elf binary: '/db/swcoe_epos2/a0393278/oe-layersetup/build/arago-tmp-external-linaro-toolchain/work/cortexa9hf-vfp-neon-3.8-oe-li-gnueabi/python/2.7.3-r0.3/packages-split/python-sqlite3/usr/lib/python2.7/lib-dynload/_sqlite3.so'
> WARNING: QA Issue: No GNU_HASH in the elf binary: '/db/swcoe_epos2/a0393278/oe-layersetup/build/arago-tmp-external-linaro-toolchain/work/cortexa9hf-vfp-neon-3.8-oe-li-gnueabi/python/2.7.3-r0.3/packages-split/python-stringold/usr/lib/python2.7/lib-dynload/strop.so'
> WARNING: QA Issue: No GNU_HASH in the elf binary: '/db/swcoe_epos2/a0393278/oe-layersetup/build/arago-tmp-external-linaro-toolchain/work/cortexa9hf-vfp-neon-3.8-oe-li-gnueabi/python/2.7.3-r0.3/packages-split/python-syslog/usr/lib/python2.7/lib-dynload/syslog.so'
> WARNING: QA Issue: No GNU_HASH in the elf binary: '/db/swcoe_epos2/a0393278/oe-layersetup/build/arago-tmp-external-linaro-toolchain/work/cortexa9hf-vfp-neon-3.8-oe-li-gnueabi/python/2.7.3-r0.3/packages-split/python-textutils/usr/lib/python2.7/lib-dynload/_csv.so'
> WARNING: QA Issue: No GNU_HASH in the elf binary: '/db/swcoe_epos2/a0393278/oe-layersetup/build/arago-tmp-external-linaro-toolchain/work/cortexa9hf-vfp-neon-3.8-oe-li-gnueabi/python/2.7.3-r0.3/packages-split/python-unixadmin/usr/lib/python2.7/lib-dynload/nis.so'
> WARNING: QA Issue: No GNU_HASH in the elf binary: '/db/swcoe_epos2/a0393278/oe-layersetup/build/arago-tmp-external-linaro-toolchain/work/cortexa9hf-vfp-neon-3.8-oe-li-gnueabi/python/2.7.3-r0.3/packages-split/python-unixadmin/usr/lib/python2.7/lib-dynload/grp.so'
> WARNING: QA Issue: No GNU_HASH in the elf binary: '/db/swcoe_epos2/a0393278/oe-layersetup/build/arago-tmp-external-linaro-toolchain/work/cortexa9hf-vfp-neon-3.8-oe-li-gnueabi/python/2.7.3-r0.3/packages-split/python-xml/usr/lib/python2.7/lib-dynload/pyexpat.so'
> WARNING: QA Issue: No GNU_HASH in the elf binary: '/db/swcoe_epos2/a0393278/oe-layersetup/build/arago-tmp-external-linaro-toolchain/work/cortexa9hf-vfp-neon-3.8-oe-li-gnueabi/python/2.7.3-r0.3/packages-split/python-zlib/usr/lib/python2.7/lib-dynload/zlib.so'
> WARNING: QA Issue: No GNU_HASH in the elf binary: '/db/swcoe_epos2/a0393278/oe-layersetup/build/arago-tmp-external-linaro-toolchain/work/cortexa9hf-vfp-neon-3.8-oe-li-gnueabi/python/2.7.3-r0.3/packages-split/python-misc/usr/lib/python2.7/lib-dynload/future_builtins.so'
> WARNING: QA Issue: No GNU_HASH in the elf binary: '/db/swcoe_epos2/a0393278/oe-layersetup/build/arago-tmp-external-linaro-toolchain/work/cortexa9hf-vfp-neon-3.8-oe-li-gnueabi/python/2.7.3-r0.3/packages-split/python-misc/usr/lib/python2.7/lib-dynload/_testcapi.so'
> WARNING: QA Issue: No GNU_HASH in the elf binary: '/db/swcoe_epos2/a0393278/oe-layersetup/build/arago-tmp-external-linaro-toolchain/work/cortexa9hf-vfp-neon-3.8-oe-li-gnueabi/python/2.7.3-r0.3/packages-split/python-misc/usr/lib/python2.7/lib-dynload/spwd.so'
> WARNING: QA Issue: No GNU_HASH in the elf binary: '/db/swcoe_epos2/a0393278/oe-layersetup/build/arago-tmp-external-linaro-toolchain/work/cortexa9hf-vfp-neon-3.8-oe-li-gnueabi/python/2.7.3-r0.3/packages-split/python-misc/usr/lib/python2.7/lib-dynload/dbm.so'
> WARNING: QA Issue: No GNU_HASH in the elf binary: '/db/swcoe_epos2/a0393278/oe-layersetup/build/arago-tmp-external-linaro-toolchain/work/cortexa9hf-vfp-neon-3.8-oe-li-gnueabi/python/2.7.3-r0.3/packages-split/python-misc/usr/lib/python2.7/lib-dynload/dl.so'
> WARNING: QA Issue: No GNU_HASH in the elf binary: '/db/swcoe_epos2/a0393278/oe-layersetup/build/arago-tmp-external-linaro-toolchain/work/cortexa9hf-vfp-neon-3.8-oe-li-gnueabi/python/2.7.3-r0.3/packages-split/python-misc/usr/lib/python2.7/lib-dynload/linuxaudiodev.so'
> WARNING: QA Issue: No GNU_HASH in the elf binary: '/db/swcoe_epos2/a0393278/oe-layersetup/build/arago-tmp-external-linaro-toolchain/work/cortexa9hf-vfp-neon-3.8-oe-li-gnueabi/am-sysinfo/git-r8/packages-split/am-sysinfo/usr/bin/mem_util'
> WARNING: QA Issue: php: Files/directories were installed but not shipped
>   /etc/php-fpm.conf
>   /etc/apache2
>   /etc/init.d
>   /etc/apache2/conf.d
>   /etc/apache2/conf.d/php-fpm.conf
>   /etc/init.d/php-fpm
> WARNING: QA Issue: No GNU_HASH in the elf binary: '/db/swcoe_epos2/a0393278/oe-layersetup/build/arago-tmp-external-linaro-toolchain/work/cortexa9hf-vfp-neon-3.8-oe-li-gnueabi/screenshot/1.0-r1/packages-split/screenshot/usr/bin/screenshot'
> ERROR: Error executing a python function in /db/swcoe_epos2/a0393278/oe-layersetup/sources/oe-core/meta/recipes-connectivity/openssl/openssl_1.0.1e.bb:
> OSError: [Errno 2] No such file or directory: '/db/swcoe_epos2/a0393278/oe-layersetup/build/arago-tmp-external-linaro-toolchain/work/am438x_epos_evm-oe-linux-gnueabi/nssl/1.0.1e-r15.0-arago6/packages-split/openssl-engines'
> 
> ERROR: The stack trace of python calls that resulted in this exception/failure was:
> ERROR:   File "do_package_ipk", line 194, in <module>
> ERROR:
> ERROR:   File "do_package_ipk", line 45, in do_package_ipk
> ERROR:
> ERROR: The code that was being executed was:
> ERROR:      0190:        bb.utils.unlockfile(lf)
> ERROR:      0191:
> ERROR:      0192:
> ERROR:      0193:
> ERROR:  *** 0194:do_package_ipk(d)
> ERROR:      0195:
> ERROR: [From file: 'do_package_ipk', lineno: 194, function: <module>]
> ERROR:      0041:        basedir = os.path.join(os.path.dirname(root))
> ERROR:      0042:        arch = localdata.getVar('PACKAGE_ARCH', True)
> ERROR:      0043:        pkgoutdir = "%s/%s" % (outdir, arch)
> ERROR:      0044:        bb.mkdirhier(pkgoutdir)
> ERROR:  *** 0045:        os.chdir(root)
> ERROR:      0046:        from glob import glob
> ERROR:      0047:        g = glob('*')
> ERROR:      0048:        try:
> ERROR:      0049:            del g[g.index('CONTROL')]
> ERROR: [From file: 'do_package_ipk', lineno: 45, function: do_package_ipk]
> ERROR: Function failed: do_package_ipk
> ERROR: Execution of event handler 'run_buildstats' failed
> Traceback (most recent call last):
>   File "run_buildstats(e)", line 104, in run_buildstats(e=<bb.build.TaskFailed object at 0x8645710>)
>   File "buildstats.bbclass", line 5, in write_task_data(status='failed', logfile='/db/swcoe_epos2/a0393278/oe-layersetup/build/arago-tmp-external-linaro-toolchain/buitats/arago-epossdk-image-am438x-epos-evm/201312170947/openssl-1.0.1e-r15.0-arago6/do_package_write_ipk', dev='NoLogicalDevice', e=<bb.build.TaskFailed object at 0x8640>)
> IOError: [Errno 2] No such file or directory: '/db/swcoe_epos2/a0393278/oe-layersetup/build/arago-tmp-external-linaro-toolchain/buildstats/arago-epossdk-image-am438x-s-evm/201312170947/openssl-1.0.1e-r15.0-arago6/do_package_write_ipk'
> 
> ERROR: Logfile of failure stored in: /db/swcoe_epos2/a0393278/oe-layersetup/build/arago-tmp-external-linaro-toolchain/work/am438x_epos_evm-oe-linux-gnueabi/openssl/1.e-r15.0-arago8/temp/log.do_package_write_ipk.12708
> ERROR: Task 2648 (/db/swcoe_epos2/a0393278/oe-layersetup/sources/oe-core/meta/recipes-connectivity/openssl/openssl_1.0.1e.bb, do_package_write_ipk) failed with exit c '1'
> NOTE: Tasks Summary: Attempted 3538 tasks of which 704 didn't need to be rerun and 1 failed.
> Waiting for 0 running tasks to finish:
> 
> Summary: 1 task failed:
>   /db/swcoe_epos2/a0393278/oe-layersetup/sources/oe-core/meta/recipes-connectivity/openssl/openssl_1.0.1e.bb, do_package_write_ipk
> Summary: There were 301 WARNING messages shown.
> Summary: There were 26 ERROR messages shown, returning a non-zero exit code.
> 
> Regards,
> Nageswari
> 

> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago


