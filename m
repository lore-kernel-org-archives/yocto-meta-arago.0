Return-Path: <nageswari@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id 20DED529C3
	for <meta-arago@arago-project.org>;
	Tue, 17 Dec 2013 08:13:41 +0000 (UTC)
Received: from dbdlxv05.itg.ti.com ([172.24.171.60])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id rBH8Dcjb027845
	for <meta-arago@arago-project.org>; Tue, 17 Dec 2013 02:13:39 -0600
Received: from DBDE73.ent.ti.com (dbde73.ent.ti.com [172.24.171.98])
	by dbdlxv05.itg.ti.com (8.14.3/8.13.8) with ESMTP id rBH8DaKe004121
	for <meta-arago@arago-project.org>; Tue, 17 Dec 2013 13:43:37 +0530
Received: from DBDE04.ent.ti.com ([fe80::21ac:d9f:f810:c8e7]) by
	DBDE73.ent.ti.com ([fe80::bc19:dc43:44da:7415%27]) with mapi id
	14.02.0342.003; Tue, 17 Dec 2013 16:13:33 +0800
From: "Srinivasan, Nageswari" <nageswari@ti.com>
To: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Thread-Topic: Build error with Crypto drivers
Thread-Index: Ac76/6MYNAKxMiGlQlqQf4xaHovKUw==
Date: Tue, 17 Dec 2013 08:13:33 +0000
Message-ID: <464859D4BE03A84686BA47749242C1D03EFC7103@DBDE04.ent.ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.24.170.142]
MIME-Version: 1.0
Subject: Build error with Crypto drivers
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
X-List-Received-Date: Tue, 17 Dec 2013 08:13:41 -0000
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_464859D4BE03A84686BA47749242C1D03EFC7103DBDE04entticom_"

--_000_464859D4BE03A84686BA47749242C1D03EFC7103DBDE04entticom_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi,
I am building EPOS SDK after rebasing to latest sources from Dylan branch (=
meta-ti) and meta-arago (2013.12) and facing below issues.
Is this a known issue and any pointers to resolve this.


WARNING: QA Issue: ELF binary '/db/swcoe_epos2/a0393278/oe-layersetup/build=
/arago-tmp-external-linaro-toolchain/work/cortexa9hf-vfp-neon-3.8-oe-linux-=
gnueabi/x264/r22git-r1/packages-split/x264/usr/lib/libx264.so.129' has relo=
cations in .text
WARNING: QA Issue: ELF binary '/db/swcoe_epos2/a0393278/oe-layersetup/build=
/arago-tmp-external-linaro-toolchain/work/cortexa9hf-vfp-neon-3.8-oe-linux-=
gnueabi/libav/0.+gitAUTOINC+2c8ce46250ff78191fe6565876ddc4bc03fdf519-r8.0-a=
rago1/packages-split/libavcodec/usr/lib/libavcodec.so.53.35.0' has relocati=
ons in .text
WARNING: The recipe quota is trying to install files into a shared area whe=
n those files already exist. Those files and their manifest location are:
   /db/swcoe_epos2/a0393278/oe-layersetup/build/arago-tmp-external-linaro-t=
oolchain/sysroots/am438x-epos-evm/usr/include/rpcsvc/rquota.h
   Matched in manifest-am438x-epos-evm-external-linaro-toolchain
   /db/swcoe_epos2/a0393278/oe-layersetup/build/arago-tmp-external-linaro-t=
oolchain/sysroots/am438x-epos-evm/usr/include/rpcsvc/rquota.x
   Matched in manifest-am438x-epos-evm-external-linaro-toolchain
Please verify which package should provide the above files.
WARNING: QA Issue: No GNU_HASH in the elf binary: '/db/swcoe_epos2/a0393278=
/oe-layersetup/build/arago-tmp-external-linaro-toolchain/work/cortexa9hf-vf=
p-neon-3.8-oe-li-gnueabi/python/2.7.3-r0.3/packages-split/python-audio/usr/=
lib/python2.7/lib-dynload/ossaudiodev.so'
WARNING: QA Issue: No GNU_HASH in the elf binary: '/db/swcoe_epos2/a0393278=
/oe-layersetup/build/arago-tmp-external-linaro-toolchain/work/cortexa9hf-vf=
p-neon-3.8-oe-li-gnueabi/python/2.7.3-r0.3/packages-split/python-audio/usr/=
lib/python2.7/lib-dynload/audioop.so'
WARNING: QA Issue: No GNU_HASH in the elf binary: '/db/swcoe_epos2/a0393278=
/oe-layersetup/build/arago-tmp-external-linaro-toolchain/work/cortexa9hf-vf=
p-neon-3.8-oe-li-gnueabi/python/2.7.3-r0.3/packages-split/python-bsddb/usr/=
lib/python2.7/lib-dynload/_bsddb.so'
WARNING: QA Issue: No GNU_HASH in the elf binary: '/db/swcoe_epos2/a0393278=
/oe-layersetup/build/arago-tmp-external-linaro-toolchain/work/cortexa9hf-vf=
p-neon-3.8-oe-li-gnueabi/python/2.7.3-r0.3/packages-split/python-codecs/usr=
/lib/python2.7/lib-dynload/_locale.so'
WARNING: QA Issue: No GNU_HASH in the elf binary: '/db/swcoe_epos2/a0393278=
/oe-layersetup/build/arago-tmp-external-linaro-toolchain/work/cortexa9hf-vf=
p-neon-3.8-oe-li-gnueabi/python/2.7.3-r0.3/packages-split/python-codecs/usr=
/lib/python2.7/lib-dynload/_multibytecodec.so'
WARNING: QA Issue: No GNU_HASH in the elf binary: '/db/swcoe_epos2/a0393278=
/oe-layersetup/build/arago-tmp-external-linaro-toolchain/work/cortexa9hf-vf=
p-neon-3.8-oe-li-gnueabi/python/2.7.3-r0.3/packages-split/python-codecs/usr=
/lib/python2.7/lib-dynload/unicodedata.so'
WARNING: QA Issue: No GNU_HASH in the elf binary: '/db/swcoe_epos2/a0393278=
/oe-layersetup/build/arago-tmp-external-linaro-toolchain/work/cortexa9hf-vf=
p-neon-3.8-oe-li-gnueabi/python/2.7.3-r0.3/packages-split/python-codecs/usr=
/lib/python2.7/lib-dynload/_codecs_kr.so'
WARNING: QA Issue: No GNU_HASH in the elf binary: '/db/swcoe_epos2/a0393278=
/oe-layersetup/build/arago-tmp-external-linaro-toolchain/work/cortexa9hf-vf=
p-neon-3.8-oe-li-gnueabi/python/2.7.3-r0.3/packages-split/python-codecs/usr=
/lib/python2.7/lib-dynload/_codecs_jp.so'
WARNING: QA Issue: No GNU_HASH in the elf binary: '/db/swcoe_epos2/a0393278=
/oe-layersetup/build/arago-tmp-external-linaro-toolchain/work/cortexa9hf-vf=
p-neon-3.8-oe-li-gnueabi/python/2.7.3-r0.3/packages-split/python-codecs/usr=
/lib/python2.7/lib-dynload/_codecs_cn.so'
WARNING: QA Issue: No GNU_HASH in the elf binary: '/db/swcoe_epos2/a0393278=
/oe-layersetup/build/arago-tmp-external-linaro-toolchain/work/cortexa9hf-vf=
p-neon-3.8-oe-li-gnueabi/python/2.7.3-r0.3/packages-split/python-codecs/usr=
/lib/python2.7/lib-dynload/_codecs_tw.so'
WARNING: QA Issue: No GNU_HASH in the elf binary: '/db/swcoe_epos2/a0393278=
/oe-layersetup/build/arago-tmp-external-linaro-toolchain/work/cortexa9hf-vf=
p-neon-3.8-oe-li-gnueabi/python/2.7.3-r0.3/packages-split/python-codecs/usr=
/lib/python2.7/lib-dynload/_codecs_hk.so'
WARNING: QA Issue: No GNU_HASH in the elf binary: '/db/swcoe_epos2/a0393278=
/oe-layersetup/build/arago-tmp-external-linaro-toolchain/work/cortexa9hf-vf=
p-neon-3.8-oe-li-gnueabi/python/2.7.3-r0.3/packages-split/python-codecs/usr=
/lib/python2.7/lib-dynload/_codecs_iso2022.so'
WARNING: QA Issue: No GNU_HASH in the elf binary: '/db/swcoe_epos2/a0393278=
/oe-layersetup/build/arago-tmp-external-linaro-toolchain/work/cortexa9hf-vf=
p-neon-3.8-oe-li-gnueabi/python/2.7.3-r0.3/packages-split/python-compressio=
n/usr/lib/python2.7/lib-dynload/bz2.so'
WARNING: QA Issue: No GNU_HASH in the elf binary: '/db/swcoe_epos2/a0393278=
/oe-layersetup/build/arago-tmp-external-linaro-toolchain/work/cortexa9hf-vf=
p-neon-3.8-oe-li-gnueabi/python/2.7.3-r0.3/packages-split/python-core/usr/l=
ib/python2.7/lib-dynload/binascii.so'
WARNING: QA Issue: No GNU_HASH in the elf binary: '/db/swcoe_epos2/a0393278=
/oe-layersetup/build/arago-tmp-external-linaro-toolchain/work/cortexa9hf-vf=
p-neon-3.8-oe-li-gnueabi/python/2.7.3-r0.3/packages-split/python-core/usr/l=
ib/python2.7/lib-dynload/_struct.so'
WARNING: QA Issue: No GNU_HASH in the elf binary: '/db/swcoe_epos2/a0393278=
/oe-layersetup/build/arago-tmp-external-linaro-toolchain/work/cortexa9hf-vf=
p-neon-3.8-oe-li-gnueabi/python/2.7.3-r0.3/packages-split/python-core/usr/l=
ib/python2.7/lib-dynload/time.so'
WARNING: QA Issue: No GNU_HASH in the elf binary: '/db/swcoe_epos2/a0393278=
/oe-layersetup/build/arago-tmp-external-linaro-toolchain/work/cortexa9hf-vf=
p-neon-3.8-oe-li-gnueabi/python/2.7.3-r0.3/packages-split/python-crypt/usr/=
lib/python2.7/lib-dynload/crypt.so'
WARNING: QA Issue: No GNU_HASH in the elf binary: '/db/swcoe_epos2/a0393278=
/oe-layersetup/build/arago-tmp-external-linaro-toolchain/work/cortexa9hf-vf=
p-neon-3.8-oe-li-gnueabi/python/2.7.3-r0.3/packages-split/python-crypt/usr/=
lib/python2.7/lib-dynload/_hashlib.so'
WARNING: QA Issue: No GNU_HASH in the elf binary: '/db/swcoe_epos2/a0393278=
/oe-layersetup/build/arago-tmp-external-linaro-toolchain/work/cortexa9hf-vf=
p-neon-3.8-oe-li-gnueabi/python/2.7.3-r0.3/packages-split/python-ctypes/usr=
/lib/python2.7/lib-dynload/_ctypes.so'
WARNING: QA Issue: No GNU_HASH in the elf binary: '/db/swcoe_epos2/a0393278=
/oe-layersetup/build/arago-tmp-external-linaro-toolchain/work/cortexa9hf-vf=
p-neon-3.8-oe-li-gnueabi/python/2.7.3-r0.3/packages-split/python-ctypes/usr=
/lib/python2.7/lib-dynload/_ctypes_test.so'
WARNING: QA Issue: No GNU_HASH in the elf binary: '/db/swcoe_epos2/a0393278=
/oe-layersetup/build/arago-tmp-external-linaro-toolchain/work/cortexa9hf-vf=
p-neon-3.8-oe-li-gnueabi/python/2.7.3-r0.3/packages-split/python-curses/usr=
/lib/python2.7/lib-dynload/_curses.so'
WARNING: QA Issue: No GNU_HASH in the elf binary: '/db/swcoe_epos2/a0393278=
/oe-layersetup/build/arago-tmp-external-linaro-toolchain/work/cortexa9hf-vf=
p-neon-3.8-oe-li-gnueabi/python/2.7.3-r0.3/packages-split/python-curses/usr=
/lib/python2.7/lib-dynload/_curses_panel.so'
WARNING: QA Issue: No GNU_HASH in the elf binary: '/db/swcoe_epos2/a0393278=
/oe-layersetup/build/arago-tmp-external-linaro-toolchain/work/cortexa9hf-vf=
p-neon-3.8-oe-li-gnueabi/python/2.7.3-r0.3/packages-split/python-datetime/u=
sr/lib/python2.7/lib-dynload/datetime.so'
WARNING: QA Issue: No GNU_HASH in the elf binary: '/db/swcoe_epos2/a0393278=
/oe-layersetup/build/arago-tmp-external-linaro-toolchain/work/cortexa9hf-vf=
p-neon-3.8-oe-li-gnueabi/python/2.7.3-r0.3/packages-split/python-elementtre=
e/usr/lib/python2.7/lib-dynload/_elementtree.so'
WARNING: QA Issue: No GNU_HASH in the elf binary: '/db/swcoe_epos2/a0393278=
/oe-layersetup/build/arago-tmp-external-linaro-toolchain/work/cortexa9hf-vf=
p-neon-3.8-oe-li-gnueabi/python/2.7.3-r0.3/packages-split/python-fcntl/usr/=
lib/python2.7/lib-dynload/fcntl.so'
WARNING: QA Issue: No GNU_HASH in the elf binary: '/db/swcoe_epos2/a0393278=
/oe-layersetup/build/arago-tmp-external-linaro-toolchain/work/cortexa9hf-vf=
p-neon-3.8-oe-li-gnueabi/python/2.7.3-r0.3/packages-split/python-gdbm/usr/l=
ib/python2.7/lib-dynload/gdbm.so'
WARNING: QA Issue: No GNU_HASH in the elf binary: '/db/swcoe_epos2/a0393278=
/oe-layersetup/build/arago-tmp-external-linaro-toolchain/work/cortexa9hf-vf=
p-neon-3.8-oe-li-gnueabi/python/2.7.3-r0.3/packages-split/python-hotshot/us=
r/lib/python2.7/lib-dynload/_hotshot.so'
WARNING: QA Issue: No GNU_HASH in the elf binary: '/db/swcoe_epos2/a0393278=
/oe-layersetup/build/arago-tmp-external-linaro-toolchain/work/cortexa9hf-vf=
p-neon-3.8-oe-li-gnueabi/python/2.7.3-r0.3/packages-split/python-image/usr/=
lib/python2.7/lib-dynload/imageop.so'
WARNING: QA Issue: No GNU_HASH in the elf binary: '/db/swcoe_epos2/a0393278=
/oe-layersetup/build/arago-tmp-external-linaro-toolchain/work/cortexa9hf-vf=
p-neon-3.8-oe-li-gnueabi/python/2.7.3-r0.3/packages-split/python-io/usr/lib=
/python2.7/lib-dynload/_socket.so'
WARNING: QA Issue: No GNU_HASH in the elf binary: '/db/swcoe_epos2/a0393278=
/oe-layersetup/build/arago-tmp-external-linaro-toolchain/work/cortexa9hf-vf=
p-neon-3.8-oe-li-gnueabi/python/2.7.3-r0.3/packages-split/python-io/usr/lib=
/python2.7/lib-dynload/_io.so'
WARNING: QA Issue: No GNU_HASH in the elf binary: '/db/swcoe_epos2/a0393278=
/oe-layersetup/build/arago-tmp-external-linaro-toolchain/work/cortexa9hf-vf=
p-neon-3.8-oe-li-gnueabi/python/2.7.3-r0.3/packages-split/python-io/usr/lib=
/python2.7/lib-dynload/_ssl.so'
WARNING: QA Issue: No GNU_HASH in the elf binary: '/db/swcoe_epos2/a0393278=
/oe-layersetup/build/arago-tmp-external-linaro-toolchain/work/cortexa9hf-vf=
p-neon-3.8-oe-li-gnueabi/python/2.7.3-r0.3/packages-split/python-io/usr/lib=
/python2.7/lib-dynload/select.so'
WARNING: QA Issue: No GNU_HASH in the elf binary: '/db/swcoe_epos2/a0393278=
/oe-layersetup/build/arago-tmp-external-linaro-toolchain/work/cortexa9hf-vf=
p-neon-3.8-oe-li-gnueabi/python/2.7.3-r0.3/packages-split/python-io/usr/lib=
/python2.7/lib-dynload/termios.so'
WARNING: QA Issue: No GNU_HASH in the elf binary: '/db/swcoe_epos2/a0393278=
/oe-layersetup/build/arago-tmp-external-linaro-toolchain/work/cortexa9hf-vf=
p-neon-3.8-oe-li-gnueabi/python/2.7.3-r0.3/packages-split/python-io/usr/lib=
/python2.7/lib-dynload/cStringIO.so'
WARNING: QA Issue: No GNU_HASH in the elf binary: '/db/swcoe_epos2/a0393278=
/oe-layersetup/build/arago-tmp-external-linaro-toolchain/work/cortexa9hf-vf=
p-neon-3.8-oe-li-gnueabi/python/2.7.3-r0.3/packages-split/python-json/usr/l=
ib/python2.7/lib-dynload/_json.so'
WARNING: QA Issue: No GNU_HASH in the elf binary: '/db/swcoe_epos2/a0393278=
/oe-layersetup/build/arago-tmp-external-linaro-toolchain/work/cortexa9hf-vf=
p-neon-3.8-oe-li-gnueabi/python/2.7.3-r0.3/packages-split/python-lang/usr/l=
ib/python2.7/lib-dynload/_bisect.so'
WARNING: QA Issue: No GNU_HASH in the elf binary: '/db/swcoe_epos2/a0393278=
/oe-layersetup/build/arago-tmp-external-linaro-toolchain/work/cortexa9hf-vf=
p-neon-3.8-oe-li-gnueabi/python/2.7.3-r0.3/packages-split/python-lang/usr/l=
ib/python2.7/lib-dynload/_collections.so'
WARNING: QA Issue: No GNU_HASH in the elf binary: '/db/swcoe_epos2/a0393278=
/oe-layersetup/build/arago-tmp-external-linaro-toolchain/work/cortexa9hf-vf=
p-neon-3.8-oe-li-gnueabi/python/2.7.3-r0.3/packages-split/python-lang/usr/l=
ib/python2.7/lib-dynload/_heapq.so'
WARNING: QA Issue: No GNU_HASH in the elf binary: '/db/swcoe_epos2/a0393278=
/oe-layersetup/build/arago-tmp-external-linaro-toolchain/work/cortexa9hf-vf=
p-neon-3.8-oe-li-gnueabi/python/2.7.3-r0.3/packages-split/python-lang/usr/l=
ib/python2.7/lib-dynload/_functools.so'
WARNING: QA Issue: No GNU_HASH in the elf binary: '/db/swcoe_epos2/a0393278=
/oe-layersetup/build/arago-tmp-external-linaro-toolchain/work/cortexa9hf-vf=
p-neon-3.8-oe-li-gnueabi/python/2.7.3-r0.3/packages-split/python-lang/usr/l=
ib/python2.7/lib-dynload/array.so'
WARNING: QA Issue: No GNU_HASH in the elf binary: '/db/swcoe_epos2/a0393278=
/oe-layersetup/build/arago-tmp-external-linaro-toolchain/work/cortexa9hf-vf=
p-neon-3.8-oe-li-gnueabi/python/2.7.3-r0.3/packages-split/python-lang/usr/l=
ib/python2.7/lib-dynload/itertools.so'
WARNING: QA Issue: No GNU_HASH in the elf binary: '/db/swcoe_epos2/a0393278=
/oe-layersetup/build/arago-tmp-external-linaro-toolchain/work/cortexa9hf-vf=
p-neon-3.8-oe-li-gnueabi/python/2.7.3-r0.3/packages-split/python-lang/usr/l=
ib/python2.7/lib-dynload/operator.so'
WARNING: QA Issue: No GNU_HASH in the elf binary: '/db/swcoe_epos2/a0393278=
/oe-layersetup/build/arago-tmp-external-linaro-toolchain/work/cortexa9hf-vf=
p-neon-3.8-oe-li-gnueabi/python/2.7.3-r0.3/packages-split/python-lang/usr/l=
ib/python2.7/lib-dynload/parser.so'
WARNING: QA Issue: No GNU_HASH in the elf binary: '/db/swcoe_epos2/a0393278=
/oe-layersetup/build/arago-tmp-external-linaro-toolchain/work/cortexa9hf-vf=
p-neon-3.8-oe-li-gnueabi/python/2.7.3-r0.3/packages-split/python-math/usr/l=
ib/python2.7/lib-dynload/cmath.so'
WARNING: QA Issue: No GNU_HASH in the elf binary: '/db/swcoe_epos2/a0393278=
/oe-layersetup/build/arago-tmp-external-linaro-toolchain/work/cortexa9hf-vf=
p-neon-3.8-oe-li-gnueabi/python/2.7.3-r0.3/packages-split/python-math/usr/l=
ib/python2.7/lib-dynload/math.so'
WARNING: QA Issue: No GNU_HASH in the elf binary: '/db/swcoe_epos2/a0393278=
/oe-layersetup/build/arago-tmp-external-linaro-toolchain/work/cortexa9hf-vf=
p-neon-3.8-oe-li-gnueabi/python/2.7.3-r0.3/packages-split/python-math/usr/l=
ib/python2.7/lib-dynload/_random.so'
WARNING: QA Issue: No GNU_HASH in the elf binary: '/db/swcoe_epos2/a0393278=
/oe-layersetup/build/arago-tmp-external-linaro-toolchain/work/cortexa9hf-vf=
p-neon-3.8-oe-li-gnueabi/python/2.7.3-r0.3/packages-split/python-mmap/usr/l=
ib/python2.7/lib-dynload/mmap.so'
WARNING: QA Issue: No GNU_HASH in the elf binary: '/db/swcoe_epos2/a0393278=
/oe-layersetup/build/arago-tmp-external-linaro-toolchain/work/cortexa9hf-vf=
p-neon-3.8-oe-li-gnueabi/python/2.7.3-r0.3/packages-split/python-multiproce=
ssing/usr/lib/python2.7/lib-dynload/_multiprocessing.so'
WARNING: QA Issue: No GNU_HASH in the elf binary: '/db/swcoe_epos2/a0393278=
/oe-layersetup/build/arago-tmp-external-linaro-toolchain/work/cortexa9hf-vf=
p-neon-3.8-oe-li-gnueabi/python/2.7.3-r0.3/packages-split/python-pickle/usr=
/lib/python2.7/lib-dynload/cPickle.so'
WARNING: QA Issue: No GNU_HASH in the elf binary: '/db/swcoe_epos2/a0393278=
/oe-layersetup/build/arago-tmp-external-linaro-toolchain/work/cortexa9hf-vf=
p-neon-3.8-oe-li-gnueabi/python/2.7.3-r0.3/packages-split/python-profile/us=
r/lib/python2.7/lib-dynload/_lsprof.so'
WARNING: QA Issue: No GNU_HASH in the elf binary: '/db/swcoe_epos2/a0393278=
/oe-layersetup/build/arago-tmp-external-linaro-toolchain/work/cortexa9hf-vf=
p-neon-3.8-oe-li-gnueabi/python/2.7.3-r0.3/packages-split/python-readline/u=
sr/lib/python2.7/lib-dynload/readline.so'
WARNING: QA Issue: No GNU_HASH in the elf binary: '/db/swcoe_epos2/a0393278=
/oe-layersetup/build/arago-tmp-external-linaro-toolchain/work/cortexa9hf-vf=
p-neon-3.8-oe-li-gnueabi/python/2.7.3-r0.3/packages-split/python-resource/u=
sr/lib/python2.7/lib-dynload/resource.so'
WARNING: QA Issue: No GNU_HASH in the elf binary: '/db/swcoe_epos2/a0393278=
/oe-layersetup/build/arago-tmp-external-linaro-toolchain/work/cortexa9hf-vf=
p-neon-3.8-oe-li-gnueabi/python/2.7.3-r0.3/packages-split/python-sqlite3/us=
r/lib/python2.7/lib-dynload/_sqlite3.so'
WARNING: QA Issue: No GNU_HASH in the elf binary: '/db/swcoe_epos2/a0393278=
/oe-layersetup/build/arago-tmp-external-linaro-toolchain/work/cortexa9hf-vf=
p-neon-3.8-oe-li-gnueabi/python/2.7.3-r0.3/packages-split/python-stringold/=
usr/lib/python2.7/lib-dynload/strop.so'
WARNING: QA Issue: No GNU_HASH in the elf binary: '/db/swcoe_epos2/a0393278=
/oe-layersetup/build/arago-tmp-external-linaro-toolchain/work/cortexa9hf-vf=
p-neon-3.8-oe-li-gnueabi/python/2.7.3-r0.3/packages-split/python-syslog/usr=
/lib/python2.7/lib-dynload/syslog.so'
WARNING: QA Issue: No GNU_HASH in the elf binary: '/db/swcoe_epos2/a0393278=
/oe-layersetup/build/arago-tmp-external-linaro-toolchain/work/cortexa9hf-vf=
p-neon-3.8-oe-li-gnueabi/python/2.7.3-r0.3/packages-split/python-textutils/=
usr/lib/python2.7/lib-dynload/_csv.so'
WARNING: QA Issue: No GNU_HASH in the elf binary: '/db/swcoe_epos2/a0393278=
/oe-layersetup/build/arago-tmp-external-linaro-toolchain/work/cortexa9hf-vf=
p-neon-3.8-oe-li-gnueabi/python/2.7.3-r0.3/packages-split/python-unixadmin/=
usr/lib/python2.7/lib-dynload/nis.so'
WARNING: QA Issue: No GNU_HASH in the elf binary: '/db/swcoe_epos2/a0393278=
/oe-layersetup/build/arago-tmp-external-linaro-toolchain/work/cortexa9hf-vf=
p-neon-3.8-oe-li-gnueabi/python/2.7.3-r0.3/packages-split/python-unixadmin/=
usr/lib/python2.7/lib-dynload/grp.so'
WARNING: QA Issue: No GNU_HASH in the elf binary: '/db/swcoe_epos2/a0393278=
/oe-layersetup/build/arago-tmp-external-linaro-toolchain/work/cortexa9hf-vf=
p-neon-3.8-oe-li-gnueabi/python/2.7.3-r0.3/packages-split/python-xml/usr/li=
b/python2.7/lib-dynload/pyexpat.so'
WARNING: QA Issue: No GNU_HASH in the elf binary: '/db/swcoe_epos2/a0393278=
/oe-layersetup/build/arago-tmp-external-linaro-toolchain/work/cortexa9hf-vf=
p-neon-3.8-oe-li-gnueabi/python/2.7.3-r0.3/packages-split/python-zlib/usr/l=
ib/python2.7/lib-dynload/zlib.so'
WARNING: QA Issue: No GNU_HASH in the elf binary: '/db/swcoe_epos2/a0393278=
/oe-layersetup/build/arago-tmp-external-linaro-toolchain/work/cortexa9hf-vf=
p-neon-3.8-oe-li-gnueabi/python/2.7.3-r0.3/packages-split/python-misc/usr/l=
ib/python2.7/lib-dynload/future_builtins.so'
WARNING: QA Issue: No GNU_HASH in the elf binary: '/db/swcoe_epos2/a0393278=
/oe-layersetup/build/arago-tmp-external-linaro-toolchain/work/cortexa9hf-vf=
p-neon-3.8-oe-li-gnueabi/python/2.7.3-r0.3/packages-split/python-misc/usr/l=
ib/python2.7/lib-dynload/_testcapi.so'
WARNING: QA Issue: No GNU_HASH in the elf binary: '/db/swcoe_epos2/a0393278=
/oe-layersetup/build/arago-tmp-external-linaro-toolchain/work/cortexa9hf-vf=
p-neon-3.8-oe-li-gnueabi/python/2.7.3-r0.3/packages-split/python-misc/usr/l=
ib/python2.7/lib-dynload/spwd.so'
WARNING: QA Issue: No GNU_HASH in the elf binary: '/db/swcoe_epos2/a0393278=
/oe-layersetup/build/arago-tmp-external-linaro-toolchain/work/cortexa9hf-vf=
p-neon-3.8-oe-li-gnueabi/python/2.7.3-r0.3/packages-split/python-misc/usr/l=
ib/python2.7/lib-dynload/dbm.so'
WARNING: QA Issue: No GNU_HASH in the elf binary: '/db/swcoe_epos2/a0393278=
/oe-layersetup/build/arago-tmp-external-linaro-toolchain/work/cortexa9hf-vf=
p-neon-3.8-oe-li-gnueabi/python/2.7.3-r0.3/packages-split/python-misc/usr/l=
ib/python2.7/lib-dynload/dl.so'
WARNING: QA Issue: No GNU_HASH in the elf binary: '/db/swcoe_epos2/a0393278=
/oe-layersetup/build/arago-tmp-external-linaro-toolchain/work/cortexa9hf-vf=
p-neon-3.8-oe-li-gnueabi/python/2.7.3-r0.3/packages-split/python-misc/usr/l=
ib/python2.7/lib-dynload/linuxaudiodev.so'
WARNING: QA Issue: No GNU_HASH in the elf binary: '/db/swcoe_epos2/a0393278=
/oe-layersetup/build/arago-tmp-external-linaro-toolchain/work/cortexa9hf-vf=
p-neon-3.8-oe-li-gnueabi/am-sysinfo/git-r8/packages-split/am-sysinfo/usr/bi=
n/mem_util'
WARNING: QA Issue: php: Files/directories were installed but not shipped
  /etc/php-fpm.conf
  /etc/apache2
  /etc/init.d
  /etc/apache2/conf.d
  /etc/apache2/conf.d/php-fpm.conf
  /etc/init.d/php-fpm
WARNING: QA Issue: No GNU_HASH in the elf binary: '/db/swcoe_epos2/a0393278=
/oe-layersetup/build/arago-tmp-external-linaro-toolchain/work/cortexa9hf-vf=
p-neon-3.8-oe-li-gnueabi/screenshot/1.0-r1/packages-split/screenshot/usr/bi=
n/screenshot'
ERROR: Error executing a python function in /db/swcoe_epos2/a0393278/oe-lay=
ersetup/sources/oe-core/meta/recipes-connectivity/openssl/openssl_1.0.1e.bb=
:
OSError: [Errno 2] No such file or directory: '/db/swcoe_epos2/a0393278/oe-=
layersetup/build/arago-tmp-external-linaro-toolchain/work/am438x_epos_evm-o=
e-linux-gnueabi/nssl/1.0.1e-r15.0-arago6/packages-split/openssl-engines'

ERROR: The stack trace of python calls that resulted in this exception/fail=
ure was:
ERROR:   File "do_package_ipk", line 194, in <module>
ERROR:
ERROR:   File "do_package_ipk", line 45, in do_package_ipk
ERROR:
ERROR: The code that was being executed was:
ERROR:      0190:        bb.utils.unlockfile(lf)
ERROR:      0191:
ERROR:      0192:
ERROR:      0193:
ERROR:  *** 0194:do_package_ipk(d)
ERROR:      0195:
ERROR: [From file: 'do_package_ipk', lineno: 194, function: <module>]
ERROR:      0041:        basedir =3D os.path.join(os.path.dirname(root))
ERROR:      0042:        arch =3D localdata.getVar('PACKAGE_ARCH', True)
ERROR:      0043:        pkgoutdir =3D "%s/%s" % (outdir, arch)
ERROR:      0044:        bb.mkdirhier(pkgoutdir)
ERROR:  *** 0045:        os.chdir(root)
ERROR:      0046:        from glob import glob
ERROR:      0047:        g =3D glob('*')
ERROR:      0048:        try:
ERROR:      0049:            del g[g.index('CONTROL')]
ERROR: [From file: 'do_package_ipk', lineno: 45, function: do_package_ipk]
ERROR: Function failed: do_package_ipk
ERROR: Execution of event handler 'run_buildstats' failed
Traceback (most recent call last):
  File "run_buildstats(e)", line 104, in run_buildstats(e=3D<bb.build.TaskF=
ailed object at 0x8645710>)
  File "buildstats.bbclass", line 5, in write_task_data(status=3D'failed', =
logfile=3D'/db/swcoe_epos2/a0393278/oe-layersetup/build/arago-tmp-external-=
linaro-toolchain/buitats/arago-epossdk-image-am438x-epos-evm/201312170947/o=
penssl-1.0.1e-r15.0-arago6/do_package_write_ipk', dev=3D'NoLogicalDevice', =
e=3D<bb.build.TaskFailed object at 0x8640>)
IOError: [Errno 2] No such file or directory: '/db/swcoe_epos2/a0393278/oe-=
layersetup/build/arago-tmp-external-linaro-toolchain/buildstats/arago-eposs=
dk-image-am438x-s-evm/201312170947/openssl-1.0.1e-r15.0-arago6/do_package_w=
rite_ipk'

ERROR: Logfile of failure stored in: /db/swcoe_epos2/a0393278/oe-layersetup=
/build/arago-tmp-external-linaro-toolchain/work/am438x_epos_evm-oe-linux-gn=
ueabi/openssl/1.e-r15.0-arago8/temp/log.do_package_write_ipk.12708
ERROR: Task 2648 (/db/swcoe_epos2/a0393278/oe-layersetup/sources/oe-core/me=
ta/recipes-connectivity/openssl/openssl_1.0.1e.bb, do_package_write_ipk) fa=
iled with exit c '1'
NOTE: Tasks Summary: Attempted 3538 tasks of which 704 didn't need to be re=
run and 1 failed.
Waiting for 0 running tasks to finish:

Summary: 1 task failed:
  /db/swcoe_epos2/a0393278/oe-layersetup/sources/oe-core/meta/recipes-conne=
ctivity/openssl/openssl_1.0.1e.bb, do_package_write_ipk
Summary: There were 301 WARNING messages shown.
Summary: There were 26 ERROR messages shown, returning a non-zero exit code=
.

Regards,
Nageswari


--_000_464859D4BE03A84686BA47749242C1D03EFC7103DBDE04entticom_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http:=
//www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<meta name=3D"Generator" content=3D"Microsoft Word 14 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
	margin-bottom:.0001pt;
	font-size:11.0pt;
	font-family:"Calibri","sans-serif";}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:blue;
	text-decoration:underline;}
a:visited, span.MsoHyperlinkFollowed
	{mso-style-priority:99;
	color:purple;
	text-decoration:underline;}
span.EmailStyle17
	{mso-style-type:personal-compose;
	font-family:"Calibri","sans-serif";
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-family:"Calibri","sans-serif";}
@page WordSection1
	{size:8.5in 11.0in;
	margin:1.0in 1.0in 1.0in 1.0in;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"EN-US" link=3D"blue" vlink=3D"purple">
<div class=3D"WordSection1">
<p class=3D"MsoNormal">Hi,<o:p></o:p></p>
<p class=3D"MsoNormal">I am building EPOS SDK after rebasing to latest sour=
ces from Dylan branch (meta-ti) and meta-arago (2013.12) and facing below i=
ssues.<o:p></o:p></p>
<p class=3D"MsoNormal">Is this a known issue and any pointers to resolve th=
is.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">WARNING: QA Issue: ELF binary '/db/swcoe_epos2/a0393=
278/oe-layersetup/build/arago-tmp-external-linaro-toolchain/work/cortexa9hf=
-vfp-neon-3.8-oe-linux-gnueabi/x264/r22git-r1/packages-split/x264/usr/lib/l=
ibx264.so.129' has relocations in
 .text<o:p></o:p></p>
<p class=3D"MsoNormal">WARNING: QA Issue: ELF binary '/db/swcoe_epos2/a0393=
278/oe-layersetup/build/arago-tmp-external-linaro-toolchain/work/cortexa9hf=
-vfp-neon-3.8-oe-linux-gnueabi/libav/0.&#43;gitAUTOINC&#43;2c8ce46250ff7819=
1fe6565876ddc4bc03fdf519-r8.0-arago1/packages-split/libavcodec/usr/lib/liba=
vcodec.so.53.35.0'
 has relocations in .text<o:p></o:p></p>
<p class=3D"MsoNormal">WARNING: The recipe quota is trying to install files=
 into a shared area when those files already exist. Those files and their m=
anifest location are:<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp; /db/swcoe_epos2/a0393278/oe-layersetup/=
build/arago-tmp-external-linaro-toolchain/sysroots/am438x-epos-evm/usr/incl=
ude/rpcsvc/rquota.h<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp; Matched in manifest-am438x-epos-evm-ext=
ernal-linaro-toolchain<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp; /db/swcoe_epos2/a0393278/oe-layersetup/=
build/arago-tmp-external-linaro-toolchain/sysroots/am438x-epos-evm/usr/incl=
ude/rpcsvc/rquota.x<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp; Matched in manifest-am438x-epos-evm-ext=
ernal-linaro-toolchain<o:p></o:p></p>
<p class=3D"MsoNormal">Please verify which package should provide the above=
 files.<o:p></o:p></p>
<p class=3D"MsoNormal">WARNING: QA Issue: No GNU_HASH in the elf binary: '/=
db/swcoe_epos2/a0393278/oe-layersetup/build/arago-tmp-external-linaro-toolc=
hain/work/cortexa9hf-vfp-neon-3.8-oe-li-gnueabi/python/2.7.3-r0.3/packages-=
split/python-audio/usr/lib/python2.7/lib-dynload/ossaudiodev.so'<o:p></o:p>=
</p>
<p class=3D"MsoNormal">WARNING: QA Issue: No GNU_HASH in the elf binary: '/=
db/swcoe_epos2/a0393278/oe-layersetup/build/arago-tmp-external-linaro-toolc=
hain/work/cortexa9hf-vfp-neon-3.8-oe-li-gnueabi/python/2.7.3-r0.3/packages-=
split/python-audio/usr/lib/python2.7/lib-dynload/audioop.so'<o:p></o:p></p>
<p class=3D"MsoNormal">WARNING: QA Issue: No GNU_HASH in the elf binary: '/=
db/swcoe_epos2/a0393278/oe-layersetup/build/arago-tmp-external-linaro-toolc=
hain/work/cortexa9hf-vfp-neon-3.8-oe-li-gnueabi/python/2.7.3-r0.3/packages-=
split/python-bsddb/usr/lib/python2.7/lib-dynload/_bsddb.so'<o:p></o:p></p>
<p class=3D"MsoNormal">WARNING: QA Issue: No GNU_HASH in the elf binary: '/=
db/swcoe_epos2/a0393278/oe-layersetup/build/arago-tmp-external-linaro-toolc=
hain/work/cortexa9hf-vfp-neon-3.8-oe-li-gnueabi/python/2.7.3-r0.3/packages-=
split/python-codecs/usr/lib/python2.7/lib-dynload/_locale.so'<o:p></o:p></p=
>
<p class=3D"MsoNormal">WARNING: QA Issue: No GNU_HASH in the elf binary: '/=
db/swcoe_epos2/a0393278/oe-layersetup/build/arago-tmp-external-linaro-toolc=
hain/work/cortexa9hf-vfp-neon-3.8-oe-li-gnueabi/python/2.7.3-r0.3/packages-=
split/python-codecs/usr/lib/python2.7/lib-dynload/_multibytecodec.so'<o:p><=
/o:p></p>
<p class=3D"MsoNormal">WARNING: QA Issue: No GNU_HASH in the elf binary: '/=
db/swcoe_epos2/a0393278/oe-layersetup/build/arago-tmp-external-linaro-toolc=
hain/work/cortexa9hf-vfp-neon-3.8-oe-li-gnueabi/python/2.7.3-r0.3/packages-=
split/python-codecs/usr/lib/python2.7/lib-dynload/unicodedata.so'<o:p></o:p=
></p>
<p class=3D"MsoNormal">WARNING: QA Issue: No GNU_HASH in the elf binary: '/=
db/swcoe_epos2/a0393278/oe-layersetup/build/arago-tmp-external-linaro-toolc=
hain/work/cortexa9hf-vfp-neon-3.8-oe-li-gnueabi/python/2.7.3-r0.3/packages-=
split/python-codecs/usr/lib/python2.7/lib-dynload/_codecs_kr.so'<o:p></o:p>=
</p>
<p class=3D"MsoNormal">WARNING: QA Issue: No GNU_HASH in the elf binary: '/=
db/swcoe_epos2/a0393278/oe-layersetup/build/arago-tmp-external-linaro-toolc=
hain/work/cortexa9hf-vfp-neon-3.8-oe-li-gnueabi/python/2.7.3-r0.3/packages-=
split/python-codecs/usr/lib/python2.7/lib-dynload/_codecs_jp.so'<o:p></o:p>=
</p>
<p class=3D"MsoNormal">WARNING: QA Issue: No GNU_HASH in the elf binary: '/=
db/swcoe_epos2/a0393278/oe-layersetup/build/arago-tmp-external-linaro-toolc=
hain/work/cortexa9hf-vfp-neon-3.8-oe-li-gnueabi/python/2.7.3-r0.3/packages-=
split/python-codecs/usr/lib/python2.7/lib-dynload/_codecs_cn.so'<o:p></o:p>=
</p>
<p class=3D"MsoNormal">WARNING: QA Issue: No GNU_HASH in the elf binary: '/=
db/swcoe_epos2/a0393278/oe-layersetup/build/arago-tmp-external-linaro-toolc=
hain/work/cortexa9hf-vfp-neon-3.8-oe-li-gnueabi/python/2.7.3-r0.3/packages-=
split/python-codecs/usr/lib/python2.7/lib-dynload/_codecs_tw.so'<o:p></o:p>=
</p>
<p class=3D"MsoNormal">WARNING: QA Issue: No GNU_HASH in the elf binary: '/=
db/swcoe_epos2/a0393278/oe-layersetup/build/arago-tmp-external-linaro-toolc=
hain/work/cortexa9hf-vfp-neon-3.8-oe-li-gnueabi/python/2.7.3-r0.3/packages-=
split/python-codecs/usr/lib/python2.7/lib-dynload/_codecs_hk.so'<o:p></o:p>=
</p>
<p class=3D"MsoNormal">WARNING: QA Issue: No GNU_HASH in the elf binary: '/=
db/swcoe_epos2/a0393278/oe-layersetup/build/arago-tmp-external-linaro-toolc=
hain/work/cortexa9hf-vfp-neon-3.8-oe-li-gnueabi/python/2.7.3-r0.3/packages-=
split/python-codecs/usr/lib/python2.7/lib-dynload/_codecs_iso2022.so'<o:p><=
/o:p></p>
<p class=3D"MsoNormal">WARNING: QA Issue: No GNU_HASH in the elf binary: '/=
db/swcoe_epos2/a0393278/oe-layersetup/build/arago-tmp-external-linaro-toolc=
hain/work/cortexa9hf-vfp-neon-3.8-oe-li-gnueabi/python/2.7.3-r0.3/packages-=
split/python-compression/usr/lib/python2.7/lib-dynload/bz2.so'<o:p></o:p></=
p>
<p class=3D"MsoNormal">WARNING: QA Issue: No GNU_HASH in the elf binary: '/=
db/swcoe_epos2/a0393278/oe-layersetup/build/arago-tmp-external-linaro-toolc=
hain/work/cortexa9hf-vfp-neon-3.8-oe-li-gnueabi/python/2.7.3-r0.3/packages-=
split/python-core/usr/lib/python2.7/lib-dynload/binascii.so'<o:p></o:p></p>
<p class=3D"MsoNormal">WARNING: QA Issue: No GNU_HASH in the elf binary: '/=
db/swcoe_epos2/a0393278/oe-layersetup/build/arago-tmp-external-linaro-toolc=
hain/work/cortexa9hf-vfp-neon-3.8-oe-li-gnueabi/python/2.7.3-r0.3/packages-=
split/python-core/usr/lib/python2.7/lib-dynload/_struct.so'<o:p></o:p></p>
<p class=3D"MsoNormal">WARNING: QA Issue: No GNU_HASH in the elf binary: '/=
db/swcoe_epos2/a0393278/oe-layersetup/build/arago-tmp-external-linaro-toolc=
hain/work/cortexa9hf-vfp-neon-3.8-oe-li-gnueabi/python/2.7.3-r0.3/packages-=
split/python-core/usr/lib/python2.7/lib-dynload/time.so'<o:p></o:p></p>
<p class=3D"MsoNormal">WARNING: QA Issue: No GNU_HASH in the elf binary: '/=
db/swcoe_epos2/a0393278/oe-layersetup/build/arago-tmp-external-linaro-toolc=
hain/work/cortexa9hf-vfp-neon-3.8-oe-li-gnueabi/python/2.7.3-r0.3/packages-=
split/python-crypt/usr/lib/python2.7/lib-dynload/crypt.so'<o:p></o:p></p>
<p class=3D"MsoNormal">WARNING: QA Issue: No GNU_HASH in the elf binary: '/=
db/swcoe_epos2/a0393278/oe-layersetup/build/arago-tmp-external-linaro-toolc=
hain/work/cortexa9hf-vfp-neon-3.8-oe-li-gnueabi/python/2.7.3-r0.3/packages-=
split/python-crypt/usr/lib/python2.7/lib-dynload/_hashlib.so'<o:p></o:p></p=
>
<p class=3D"MsoNormal">WARNING: QA Issue: No GNU_HASH in the elf binary: '/=
db/swcoe_epos2/a0393278/oe-layersetup/build/arago-tmp-external-linaro-toolc=
hain/work/cortexa9hf-vfp-neon-3.8-oe-li-gnueabi/python/2.7.3-r0.3/packages-=
split/python-ctypes/usr/lib/python2.7/lib-dynload/_ctypes.so'<o:p></o:p></p=
>
<p class=3D"MsoNormal">WARNING: QA Issue: No GNU_HASH in the elf binary: '/=
db/swcoe_epos2/a0393278/oe-layersetup/build/arago-tmp-external-linaro-toolc=
hain/work/cortexa9hf-vfp-neon-3.8-oe-li-gnueabi/python/2.7.3-r0.3/packages-=
split/python-ctypes/usr/lib/python2.7/lib-dynload/_ctypes_test.so'<o:p></o:=
p></p>
<p class=3D"MsoNormal">WARNING: QA Issue: No GNU_HASH in the elf binary: '/=
db/swcoe_epos2/a0393278/oe-layersetup/build/arago-tmp-external-linaro-toolc=
hain/work/cortexa9hf-vfp-neon-3.8-oe-li-gnueabi/python/2.7.3-r0.3/packages-=
split/python-curses/usr/lib/python2.7/lib-dynload/_curses.so'<o:p></o:p></p=
>
<p class=3D"MsoNormal">WARNING: QA Issue: No GNU_HASH in the elf binary: '/=
db/swcoe_epos2/a0393278/oe-layersetup/build/arago-tmp-external-linaro-toolc=
hain/work/cortexa9hf-vfp-neon-3.8-oe-li-gnueabi/python/2.7.3-r0.3/packages-=
split/python-curses/usr/lib/python2.7/lib-dynload/_curses_panel.so'<o:p></o=
:p></p>
<p class=3D"MsoNormal">WARNING: QA Issue: No GNU_HASH in the elf binary: '/=
db/swcoe_epos2/a0393278/oe-layersetup/build/arago-tmp-external-linaro-toolc=
hain/work/cortexa9hf-vfp-neon-3.8-oe-li-gnueabi/python/2.7.3-r0.3/packages-=
split/python-datetime/usr/lib/python2.7/lib-dynload/datetime.so'<o:p></o:p>=
</p>
<p class=3D"MsoNormal">WARNING: QA Issue: No GNU_HASH in the elf binary: '/=
db/swcoe_epos2/a0393278/oe-layersetup/build/arago-tmp-external-linaro-toolc=
hain/work/cortexa9hf-vfp-neon-3.8-oe-li-gnueabi/python/2.7.3-r0.3/packages-=
split/python-elementtree/usr/lib/python2.7/lib-dynload/_elementtree.so'<o:p=
></o:p></p>
<p class=3D"MsoNormal">WARNING: QA Issue: No GNU_HASH in the elf binary: '/=
db/swcoe_epos2/a0393278/oe-layersetup/build/arago-tmp-external-linaro-toolc=
hain/work/cortexa9hf-vfp-neon-3.8-oe-li-gnueabi/python/2.7.3-r0.3/packages-=
split/python-fcntl/usr/lib/python2.7/lib-dynload/fcntl.so'<o:p></o:p></p>
<p class=3D"MsoNormal">WARNING: QA Issue: No GNU_HASH in the elf binary: '/=
db/swcoe_epos2/a0393278/oe-layersetup/build/arago-tmp-external-linaro-toolc=
hain/work/cortexa9hf-vfp-neon-3.8-oe-li-gnueabi/python/2.7.3-r0.3/packages-=
split/python-gdbm/usr/lib/python2.7/lib-dynload/gdbm.so'<o:p></o:p></p>
<p class=3D"MsoNormal">WARNING: QA Issue: No GNU_HASH in the elf binary: '/=
db/swcoe_epos2/a0393278/oe-layersetup/build/arago-tmp-external-linaro-toolc=
hain/work/cortexa9hf-vfp-neon-3.8-oe-li-gnueabi/python/2.7.3-r0.3/packages-=
split/python-hotshot/usr/lib/python2.7/lib-dynload/_hotshot.so'<o:p></o:p><=
/p>
<p class=3D"MsoNormal">WARNING: QA Issue: No GNU_HASH in the elf binary: '/=
db/swcoe_epos2/a0393278/oe-layersetup/build/arago-tmp-external-linaro-toolc=
hain/work/cortexa9hf-vfp-neon-3.8-oe-li-gnueabi/python/2.7.3-r0.3/packages-=
split/python-image/usr/lib/python2.7/lib-dynload/imageop.so'<o:p></o:p></p>
<p class=3D"MsoNormal">WARNING: QA Issue: No GNU_HASH in the elf binary: '/=
db/swcoe_epos2/a0393278/oe-layersetup/build/arago-tmp-external-linaro-toolc=
hain/work/cortexa9hf-vfp-neon-3.8-oe-li-gnueabi/python/2.7.3-r0.3/packages-=
split/python-io/usr/lib/python2.7/lib-dynload/_socket.so'<o:p></o:p></p>
<p class=3D"MsoNormal">WARNING: QA Issue: No GNU_HASH in the elf binary: '/=
db/swcoe_epos2/a0393278/oe-layersetup/build/arago-tmp-external-linaro-toolc=
hain/work/cortexa9hf-vfp-neon-3.8-oe-li-gnueabi/python/2.7.3-r0.3/packages-=
split/python-io/usr/lib/python2.7/lib-dynload/_io.so'<o:p></o:p></p>
<p class=3D"MsoNormal">WARNING: QA Issue: No GNU_HASH in the elf binary: '/=
db/swcoe_epos2/a0393278/oe-layersetup/build/arago-tmp-external-linaro-toolc=
hain/work/cortexa9hf-vfp-neon-3.8-oe-li-gnueabi/python/2.7.3-r0.3/packages-=
split/python-io/usr/lib/python2.7/lib-dynload/_ssl.so'<o:p></o:p></p>
<p class=3D"MsoNormal">WARNING: QA Issue: No GNU_HASH in the elf binary: '/=
db/swcoe_epos2/a0393278/oe-layersetup/build/arago-tmp-external-linaro-toolc=
hain/work/cortexa9hf-vfp-neon-3.8-oe-li-gnueabi/python/2.7.3-r0.3/packages-=
split/python-io/usr/lib/python2.7/lib-dynload/select.so'<o:p></o:p></p>
<p class=3D"MsoNormal">WARNING: QA Issue: No GNU_HASH in the elf binary: '/=
db/swcoe_epos2/a0393278/oe-layersetup/build/arago-tmp-external-linaro-toolc=
hain/work/cortexa9hf-vfp-neon-3.8-oe-li-gnueabi/python/2.7.3-r0.3/packages-=
split/python-io/usr/lib/python2.7/lib-dynload/termios.so'<o:p></o:p></p>
<p class=3D"MsoNormal">WARNING: QA Issue: No GNU_HASH in the elf binary: '/=
db/swcoe_epos2/a0393278/oe-layersetup/build/arago-tmp-external-linaro-toolc=
hain/work/cortexa9hf-vfp-neon-3.8-oe-li-gnueabi/python/2.7.3-r0.3/packages-=
split/python-io/usr/lib/python2.7/lib-dynload/cStringIO.so'<o:p></o:p></p>
<p class=3D"MsoNormal">WARNING: QA Issue: No GNU_HASH in the elf binary: '/=
db/swcoe_epos2/a0393278/oe-layersetup/build/arago-tmp-external-linaro-toolc=
hain/work/cortexa9hf-vfp-neon-3.8-oe-li-gnueabi/python/2.7.3-r0.3/packages-=
split/python-json/usr/lib/python2.7/lib-dynload/_json.so'<o:p></o:p></p>
<p class=3D"MsoNormal">WARNING: QA Issue: No GNU_HASH in the elf binary: '/=
db/swcoe_epos2/a0393278/oe-layersetup/build/arago-tmp-external-linaro-toolc=
hain/work/cortexa9hf-vfp-neon-3.8-oe-li-gnueabi/python/2.7.3-r0.3/packages-=
split/python-lang/usr/lib/python2.7/lib-dynload/_bisect.so'<o:p></o:p></p>
<p class=3D"MsoNormal">WARNING: QA Issue: No GNU_HASH in the elf binary: '/=
db/swcoe_epos2/a0393278/oe-layersetup/build/arago-tmp-external-linaro-toolc=
hain/work/cortexa9hf-vfp-neon-3.8-oe-li-gnueabi/python/2.7.3-r0.3/packages-=
split/python-lang/usr/lib/python2.7/lib-dynload/_collections.so'<o:p></o:p>=
</p>
<p class=3D"MsoNormal">WARNING: QA Issue: No GNU_HASH in the elf binary: '/=
db/swcoe_epos2/a0393278/oe-layersetup/build/arago-tmp-external-linaro-toolc=
hain/work/cortexa9hf-vfp-neon-3.8-oe-li-gnueabi/python/2.7.3-r0.3/packages-=
split/python-lang/usr/lib/python2.7/lib-dynload/_heapq.so'<o:p></o:p></p>
<p class=3D"MsoNormal">WARNING: QA Issue: No GNU_HASH in the elf binary: '/=
db/swcoe_epos2/a0393278/oe-layersetup/build/arago-tmp-external-linaro-toolc=
hain/work/cortexa9hf-vfp-neon-3.8-oe-li-gnueabi/python/2.7.3-r0.3/packages-=
split/python-lang/usr/lib/python2.7/lib-dynload/_functools.so'<o:p></o:p></=
p>
<p class=3D"MsoNormal">WARNING: QA Issue: No GNU_HASH in the elf binary: '/=
db/swcoe_epos2/a0393278/oe-layersetup/build/arago-tmp-external-linaro-toolc=
hain/work/cortexa9hf-vfp-neon-3.8-oe-li-gnueabi/python/2.7.3-r0.3/packages-=
split/python-lang/usr/lib/python2.7/lib-dynload/array.so'<o:p></o:p></p>
<p class=3D"MsoNormal">WARNING: QA Issue: No GNU_HASH in the elf binary: '/=
db/swcoe_epos2/a0393278/oe-layersetup/build/arago-tmp-external-linaro-toolc=
hain/work/cortexa9hf-vfp-neon-3.8-oe-li-gnueabi/python/2.7.3-r0.3/packages-=
split/python-lang/usr/lib/python2.7/lib-dynload/itertools.so'<o:p></o:p></p=
>
<p class=3D"MsoNormal">WARNING: QA Issue: No GNU_HASH in the elf binary: '/=
db/swcoe_epos2/a0393278/oe-layersetup/build/arago-tmp-external-linaro-toolc=
hain/work/cortexa9hf-vfp-neon-3.8-oe-li-gnueabi/python/2.7.3-r0.3/packages-=
split/python-lang/usr/lib/python2.7/lib-dynload/operator.so'<o:p></o:p></p>
<p class=3D"MsoNormal">WARNING: QA Issue: No GNU_HASH in the elf binary: '/=
db/swcoe_epos2/a0393278/oe-layersetup/build/arago-tmp-external-linaro-toolc=
hain/work/cortexa9hf-vfp-neon-3.8-oe-li-gnueabi/python/2.7.3-r0.3/packages-=
split/python-lang/usr/lib/python2.7/lib-dynload/parser.so'<o:p></o:p></p>
<p class=3D"MsoNormal">WARNING: QA Issue: No GNU_HASH in the elf binary: '/=
db/swcoe_epos2/a0393278/oe-layersetup/build/arago-tmp-external-linaro-toolc=
hain/work/cortexa9hf-vfp-neon-3.8-oe-li-gnueabi/python/2.7.3-r0.3/packages-=
split/python-math/usr/lib/python2.7/lib-dynload/cmath.so'<o:p></o:p></p>
<p class=3D"MsoNormal">WARNING: QA Issue: No GNU_HASH in the elf binary: '/=
db/swcoe_epos2/a0393278/oe-layersetup/build/arago-tmp-external-linaro-toolc=
hain/work/cortexa9hf-vfp-neon-3.8-oe-li-gnueabi/python/2.7.3-r0.3/packages-=
split/python-math/usr/lib/python2.7/lib-dynload/math.so'<o:p></o:p></p>
<p class=3D"MsoNormal">WARNING: QA Issue: No GNU_HASH in the elf binary: '/=
db/swcoe_epos2/a0393278/oe-layersetup/build/arago-tmp-external-linaro-toolc=
hain/work/cortexa9hf-vfp-neon-3.8-oe-li-gnueabi/python/2.7.3-r0.3/packages-=
split/python-math/usr/lib/python2.7/lib-dynload/_random.so'<o:p></o:p></p>
<p class=3D"MsoNormal">WARNING: QA Issue: No GNU_HASH in the elf binary: '/=
db/swcoe_epos2/a0393278/oe-layersetup/build/arago-tmp-external-linaro-toolc=
hain/work/cortexa9hf-vfp-neon-3.8-oe-li-gnueabi/python/2.7.3-r0.3/packages-=
split/python-mmap/usr/lib/python2.7/lib-dynload/mmap.so'<o:p></o:p></p>
<p class=3D"MsoNormal">WARNING: QA Issue: No GNU_HASH in the elf binary: '/=
db/swcoe_epos2/a0393278/oe-layersetup/build/arago-tmp-external-linaro-toolc=
hain/work/cortexa9hf-vfp-neon-3.8-oe-li-gnueabi/python/2.7.3-r0.3/packages-=
split/python-multiprocessing/usr/lib/python2.7/lib-dynload/_multiprocessing=
.so'<o:p></o:p></p>
<p class=3D"MsoNormal">WARNING: QA Issue: No GNU_HASH in the elf binary: '/=
db/swcoe_epos2/a0393278/oe-layersetup/build/arago-tmp-external-linaro-toolc=
hain/work/cortexa9hf-vfp-neon-3.8-oe-li-gnueabi/python/2.7.3-r0.3/packages-=
split/python-pickle/usr/lib/python2.7/lib-dynload/cPickle.so'<o:p></o:p></p=
>
<p class=3D"MsoNormal">WARNING: QA Issue: No GNU_HASH in the elf binary: '/=
db/swcoe_epos2/a0393278/oe-layersetup/build/arago-tmp-external-linaro-toolc=
hain/work/cortexa9hf-vfp-neon-3.8-oe-li-gnueabi/python/2.7.3-r0.3/packages-=
split/python-profile/usr/lib/python2.7/lib-dynload/_lsprof.so'<o:p></o:p></=
p>
<p class=3D"MsoNormal">WARNING: QA Issue: No GNU_HASH in the elf binary: '/=
db/swcoe_epos2/a0393278/oe-layersetup/build/arago-tmp-external-linaro-toolc=
hain/work/cortexa9hf-vfp-neon-3.8-oe-li-gnueabi/python/2.7.3-r0.3/packages-=
split/python-readline/usr/lib/python2.7/lib-dynload/readline.so'<o:p></o:p>=
</p>
<p class=3D"MsoNormal">WARNING: QA Issue: No GNU_HASH in the elf binary: '/=
db/swcoe_epos2/a0393278/oe-layersetup/build/arago-tmp-external-linaro-toolc=
hain/work/cortexa9hf-vfp-neon-3.8-oe-li-gnueabi/python/2.7.3-r0.3/packages-=
split/python-resource/usr/lib/python2.7/lib-dynload/resource.so'<o:p></o:p>=
</p>
<p class=3D"MsoNormal">WARNING: QA Issue: No GNU_HASH in the elf binary: '/=
db/swcoe_epos2/a0393278/oe-layersetup/build/arago-tmp-external-linaro-toolc=
hain/work/cortexa9hf-vfp-neon-3.8-oe-li-gnueabi/python/2.7.3-r0.3/packages-=
split/python-sqlite3/usr/lib/python2.7/lib-dynload/_sqlite3.so'<o:p></o:p><=
/p>
<p class=3D"MsoNormal">WARNING: QA Issue: No GNU_HASH in the elf binary: '/=
db/swcoe_epos2/a0393278/oe-layersetup/build/arago-tmp-external-linaro-toolc=
hain/work/cortexa9hf-vfp-neon-3.8-oe-li-gnueabi/python/2.7.3-r0.3/packages-=
split/python-stringold/usr/lib/python2.7/lib-dynload/strop.so'<o:p></o:p></=
p>
<p class=3D"MsoNormal">WARNING: QA Issue: No GNU_HASH in the elf binary: '/=
db/swcoe_epos2/a0393278/oe-layersetup/build/arago-tmp-external-linaro-toolc=
hain/work/cortexa9hf-vfp-neon-3.8-oe-li-gnueabi/python/2.7.3-r0.3/packages-=
split/python-syslog/usr/lib/python2.7/lib-dynload/syslog.so'<o:p></o:p></p>
<p class=3D"MsoNormal">WARNING: QA Issue: No GNU_HASH in the elf binary: '/=
db/swcoe_epos2/a0393278/oe-layersetup/build/arago-tmp-external-linaro-toolc=
hain/work/cortexa9hf-vfp-neon-3.8-oe-li-gnueabi/python/2.7.3-r0.3/packages-=
split/python-textutils/usr/lib/python2.7/lib-dynload/_csv.so'<o:p></o:p></p=
>
<p class=3D"MsoNormal">WARNING: QA Issue: No GNU_HASH in the elf binary: '/=
db/swcoe_epos2/a0393278/oe-layersetup/build/arago-tmp-external-linaro-toolc=
hain/work/cortexa9hf-vfp-neon-3.8-oe-li-gnueabi/python/2.7.3-r0.3/packages-=
split/python-unixadmin/usr/lib/python2.7/lib-dynload/nis.so'<o:p></o:p></p>
<p class=3D"MsoNormal">WARNING: QA Issue: No GNU_HASH in the elf binary: '/=
db/swcoe_epos2/a0393278/oe-layersetup/build/arago-tmp-external-linaro-toolc=
hain/work/cortexa9hf-vfp-neon-3.8-oe-li-gnueabi/python/2.7.3-r0.3/packages-=
split/python-unixadmin/usr/lib/python2.7/lib-dynload/grp.so'<o:p></o:p></p>
<p class=3D"MsoNormal">WARNING: QA Issue: No GNU_HASH in the elf binary: '/=
db/swcoe_epos2/a0393278/oe-layersetup/build/arago-tmp-external-linaro-toolc=
hain/work/cortexa9hf-vfp-neon-3.8-oe-li-gnueabi/python/2.7.3-r0.3/packages-=
split/python-xml/usr/lib/python2.7/lib-dynload/pyexpat.so'<o:p></o:p></p>
<p class=3D"MsoNormal">WARNING: QA Issue: No GNU_HASH in the elf binary: '/=
db/swcoe_epos2/a0393278/oe-layersetup/build/arago-tmp-external-linaro-toolc=
hain/work/cortexa9hf-vfp-neon-3.8-oe-li-gnueabi/python/2.7.3-r0.3/packages-=
split/python-zlib/usr/lib/python2.7/lib-dynload/zlib.so'<o:p></o:p></p>
<p class=3D"MsoNormal">WARNING: QA Issue: No GNU_HASH in the elf binary: '/=
db/swcoe_epos2/a0393278/oe-layersetup/build/arago-tmp-external-linaro-toolc=
hain/work/cortexa9hf-vfp-neon-3.8-oe-li-gnueabi/python/2.7.3-r0.3/packages-=
split/python-misc/usr/lib/python2.7/lib-dynload/future_builtins.so'<o:p></o=
:p></p>
<p class=3D"MsoNormal">WARNING: QA Issue: No GNU_HASH in the elf binary: '/=
db/swcoe_epos2/a0393278/oe-layersetup/build/arago-tmp-external-linaro-toolc=
hain/work/cortexa9hf-vfp-neon-3.8-oe-li-gnueabi/python/2.7.3-r0.3/packages-=
split/python-misc/usr/lib/python2.7/lib-dynload/_testcapi.so'<o:p></o:p></p=
>
<p class=3D"MsoNormal">WARNING: QA Issue: No GNU_HASH in the elf binary: '/=
db/swcoe_epos2/a0393278/oe-layersetup/build/arago-tmp-external-linaro-toolc=
hain/work/cortexa9hf-vfp-neon-3.8-oe-li-gnueabi/python/2.7.3-r0.3/packages-=
split/python-misc/usr/lib/python2.7/lib-dynload/spwd.so'<o:p></o:p></p>
<p class=3D"MsoNormal">WARNING: QA Issue: No GNU_HASH in the elf binary: '/=
db/swcoe_epos2/a0393278/oe-layersetup/build/arago-tmp-external-linaro-toolc=
hain/work/cortexa9hf-vfp-neon-3.8-oe-li-gnueabi/python/2.7.3-r0.3/packages-=
split/python-misc/usr/lib/python2.7/lib-dynload/dbm.so'<o:p></o:p></p>
<p class=3D"MsoNormal">WARNING: QA Issue: No GNU_HASH in the elf binary: '/=
db/swcoe_epos2/a0393278/oe-layersetup/build/arago-tmp-external-linaro-toolc=
hain/work/cortexa9hf-vfp-neon-3.8-oe-li-gnueabi/python/2.7.3-r0.3/packages-=
split/python-misc/usr/lib/python2.7/lib-dynload/dl.so'<o:p></o:p></p>
<p class=3D"MsoNormal">WARNING: QA Issue: No GNU_HASH in the elf binary: '/=
db/swcoe_epos2/a0393278/oe-layersetup/build/arago-tmp-external-linaro-toolc=
hain/work/cortexa9hf-vfp-neon-3.8-oe-li-gnueabi/python/2.7.3-r0.3/packages-=
split/python-misc/usr/lib/python2.7/lib-dynload/linuxaudiodev.so'<o:p></o:p=
></p>
<p class=3D"MsoNormal">WARNING: QA Issue: No GNU_HASH in the elf binary: '/=
db/swcoe_epos2/a0393278/oe-layersetup/build/arago-tmp-external-linaro-toolc=
hain/work/cortexa9hf-vfp-neon-3.8-oe-li-gnueabi/am-sysinfo/git-r8/packages-=
split/am-sysinfo/usr/bin/mem_util'<o:p></o:p></p>
<p class=3D"MsoNormal">WARNING: QA Issue: php: Files/directories were insta=
lled but not shipped<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp; /etc/php-fpm.conf<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp; /etc/apache2<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp; /etc/init.d<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp; /etc/apache2/conf.d<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp; /etc/apache2/conf.d/php-fpm.conf<o:p></o:p></=
p>
<p class=3D"MsoNormal">&nbsp; /etc/init.d/php-fpm<o:p></o:p></p>
<p class=3D"MsoNormal">WARNING: QA Issue: No GNU_HASH in the elf binary: '/=
db/swcoe_epos2/a0393278/oe-layersetup/build/arago-tmp-external-linaro-toolc=
hain/work/cortexa9hf-vfp-neon-3.8-oe-li-gnueabi/screenshot/1.0-r1/packages-=
split/screenshot/usr/bin/screenshot'<o:p></o:p></p>
<p class=3D"MsoNormal">ERROR: Error executing a python function in /db/swco=
e_epos2/a0393278/oe-layersetup/sources/oe-core/meta/recipes-connectivity/op=
enssl/openssl_1.0.1e.bb:<o:p></o:p></p>
<p class=3D"MsoNormal">OSError: [Errno 2] No such file or directory: '/db/s=
wcoe_epos2/a0393278/oe-layersetup/build/arago-tmp-external-linaro-toolchain=
/work/am438x_epos_evm-oe-linux-gnueabi/nssl/1.0.1e-r15.0-arago6/packages-sp=
lit/openssl-engines'<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">ERROR: The stack trace of python calls that resulted=
 in this exception/failure was:<o:p></o:p></p>
<p class=3D"MsoNormal">ERROR:&nbsp;&nbsp; File &quot;do_package_ipk&quot;, =
line 194, in &lt;module&gt;<o:p></o:p></p>
<p class=3D"MsoNormal">ERROR:<o:p></o:p></p>
<p class=3D"MsoNormal">ERROR:&nbsp;&nbsp; File &quot;do_package_ipk&quot;, =
line 45, in do_package_ipk<o:p></o:p></p>
<p class=3D"MsoNormal">ERROR:<o:p></o:p></p>
<p class=3D"MsoNormal">ERROR: The code that was being executed was:<o:p></o=
:p></p>
<p class=3D"MsoNormal">ERROR:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0190:&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; bb.utils.unlockfile(lf)<o:p></o:p></p>
<p class=3D"MsoNormal">ERROR:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0191:<o:p></o:p=
></p>
<p class=3D"MsoNormal">ERROR:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0192:<o:p></o:p=
></p>
<p class=3D"MsoNormal">ERROR:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0193:<o:p></o:p=
></p>
<p class=3D"MsoNormal">ERROR:&nbsp; *** 0194:do_package_ipk(d)<o:p></o:p></=
p>
<p class=3D"MsoNormal">ERROR:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0195:<o:p></o:p=
></p>
<p class=3D"MsoNormal">ERROR: [From file: 'do_package_ipk', lineno: 194, fu=
nction: &lt;module&gt;]<o:p></o:p></p>
<p class=3D"MsoNormal">ERROR:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0041:&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; basedir =3D os.path.join(os.path.dirname(r=
oot))<o:p></o:p></p>
<p class=3D"MsoNormal">ERROR:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0042:&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; arch =3D localdata.getVar('PACKAGE_ARCH', =
True)<o:p></o:p></p>
<p class=3D"MsoNormal">ERROR:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0043:&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pkgoutdir =3D &quot;%s/%s&quot; % (outdir,=
 arch)<o:p></o:p></p>
<p class=3D"MsoNormal">ERROR:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0044:&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; bb.mkdirhier(pkgoutdir)<o:p></o:p></p>
<p class=3D"MsoNormal">ERROR:&nbsp; *** 0045:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp; os.chdir(root)<o:p></o:p></p>
<p class=3D"MsoNormal">ERROR:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0046: &nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;from glob import glob<o:p></o:p></p>
<p class=3D"MsoNormal">ERROR:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0047:&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; g =3D glob('*')<o:p></o:p></p>
<p class=3D"MsoNormal">ERROR:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0048:&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; try:<o:p></o:p></p>
<p class=3D"MsoNormal">ERROR:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0049:&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; del g[g.index('CON=
TROL')]<o:p></o:p></p>
<p class=3D"MsoNormal">ERROR: [From file: 'do_package_ipk', lineno: 45, fun=
ction: do_package_ipk]<o:p></o:p></p>
<p class=3D"MsoNormal">ERROR: Function failed: do_package_ipk<o:p></o:p></p=
>
<p class=3D"MsoNormal">ERROR: Execution of event handler 'run_buildstats' f=
ailed<o:p></o:p></p>
<p class=3D"MsoNormal">Traceback (most recent call last):<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp; File &quot;run_buildstats(e)&quot;, line 104,=
 in run_buildstats(e=3D&lt;bb.build.TaskFailed object at 0x8645710&gt;)<o:p=
></o:p></p>
<p class=3D"MsoNormal">&nbsp; File &quot;buildstats.bbclass&quot;, line 5, =
in write_task_data(status=3D'failed', logfile=3D'/db/swcoe_epos2/a0393278/o=
e-layersetup/build/arago-tmp-external-linaro-toolchain/buitats/arago-epossd=
k-image-am438x-epos-evm/201312170947/openssl-1.0.1e-r15.0-arago6/do_package=
_write_ipk',
 dev=3D'NoLogicalDevice', e=3D&lt;bb.build.TaskFailed object at 0x8640&gt;)=
<o:p></o:p></p>
<p class=3D"MsoNormal">IOError: [Errno 2] No such file or directory: '/db/s=
wcoe_epos2/a0393278/oe-layersetup/build/arago-tmp-external-linaro-toolchain=
/buildstats/arago-epossdk-image-am438x-s-evm/201312170947/openssl-1.0.1e-r1=
5.0-arago6/do_package_write_ipk'<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">ERROR: Logfile of failure stored in: /db/swcoe_epos2=
/a0393278/oe-layersetup/build/arago-tmp-external-linaro-toolchain/work/am43=
8x_epos_evm-oe-linux-gnueabi/openssl/1.e-r15.0-arago8/temp/log.do_package_w=
rite_ipk.12708<o:p></o:p></p>
<p class=3D"MsoNormal">ERROR: Task 2648 (/db/swcoe_epos2/a0393278/oe-layers=
etup/sources/oe-core/meta/recipes-connectivity/openssl/openssl_1.0.1e.bb, d=
o_package_write_ipk) failed with exit c '1'<o:p></o:p></p>
<p class=3D"MsoNormal">NOTE: Tasks Summary: Attempted 3538 tasks of which 7=
04 didn't need to be rerun and 1 failed.<o:p></o:p></p>
<p class=3D"MsoNormal">Waiting for 0 running tasks to finish:<o:p></o:p></p=
>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Summary: 1 task failed:<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp; /db/swcoe_epos2/a0393278/oe-layersetup/source=
s/oe-core/meta/recipes-connectivity/openssl/openssl_1.0.1e.bb, do_package_w=
rite_ipk<o:p></o:p></p>
<p class=3D"MsoNormal">Summary: There were 301 WARNING messages shown.<o:p>=
</o:p></p>
<p class=3D"MsoNormal">Summary: There were 26 ERROR messages shown, returni=
ng a non-zero exit code.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Regards,<o:p></o:p></p>
<p class=3D"MsoNormal">Nageswari<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
</body>
</html>

--_000_464859D4BE03A84686BA47749242C1D03EFC7103DBDE04entticom_--
