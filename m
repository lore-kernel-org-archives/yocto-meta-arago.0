Return-Path: <denys@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id 9629C52976
	for <meta-arago@arago-project.org>;
	Wed, 29 May 2013 18:34:11 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id r4TIYAsv004974
	for <meta-arago@arago-project.org>; Wed, 29 May 2013 13:34:10 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id r4TIYAsh013767
	for <meta-arago@arago-project.org>; Wed, 29 May 2013 13:34:10 -0500
Received: from dlelxv22.itg.ti.com (172.17.1.197) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.2.342.3;
	Wed, 29 May 2013 13:34:10 -0500
Received: from localhost (gtudedge.gt.design.ti.com [158.218.102.158])	by
	dlelxv22.itg.ti.com (8.13.8/8.13.8) with ESMTP id r4TIYAiV009952;
	Wed, 29 May 2013 13:34:10 -0500
Date: Wed, 29 May 2013 14:34:09 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: "Zhang, Hao" <hzhang@ti.com>
Message-ID: <20130529183409.GD4526@edge>
References: <ECA334CFBA16F74DB2C66A2F1181F4D63C2BACD3@DLEE09.ent.ti.com>
MIME-Version: 1.0
In-Reply-To: <ECA334CFBA16F74DB2C66A2F1181F4D63C2BACD3@DLEE09.ent.ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: QA Issue warnings in the Yocto build
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
X-List-Received-Date: Wed, 29 May 2013 18:34:11 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Tue, May 28, 2013 at 11:09:59PM +0000, Zhang, Hao wrote:
> We found a lot of QA issues in the nightly Yocto build, are these warnings 
> causing any real problems? And how can we fix these warnings:

Hao,

Those warnings are in Python's plugins and while it would be nice to fix them 
(which I think is already done in oe-core/master), they are mostly harmless.

-- 
Denys


> WARNING: QA Issue: No GNU_HASH in the elf binary: '/home/gtbldadm/yocto/mcsdk-3_00_00_11/oe-layersetup-mcsdk/build/arago-tmp-external-linaro-toolchain/work/armv7ahf-vfp-neon-oe-linux-gnueabi/python-2.7.3-r0.3/packages-split/python-audio/usr/lib/python2.7/lib-dynload/ossaudiodev.so'
> WARNING: QA Issue: No GNU_HASH in the elf binary: '/home/gtbldadm/yocto/mcsdk-3_00_00_11/oe-layersetup-mcsdk/build/arago-tmp-external-linaro-toolchain/work/armv7ahf-vfp-neon-oe-linux-gnueabi/python-2.7.3-r0.3/packages-split/python-audio/usr/lib/python2.7/lib-dynload/audioop.so'
> WARNING: QA Issue: No GNU_HASH in the elf binary: '/home/gtbldadm/yocto/mcsdk-3_00_00_11/oe-layersetup-mcsdk/build/arago-tmp-external-linaro-toolchain/work/armv7ahf-vfp-neon-oe-linux-gnueabi/python-2.7.3-r0.3/packages-split/python-bsddb/usr/lib/python2.7/lib-dynload/_bsddb.so'
> WARNING: QA Issue: No GNU_HASH in the elf binary: '/home/gtbldadm/yocto/mcsdk-3_00_00_11/oe-layersetup-mcsdk/build/arago-tmp-external-linaro-toolchain/work/armv7ahf-vfp-neon-oe-linux-gnueabi/python-2.7.3-r0.3/packages-split/python-codecs/usr/lib/python2.7/lib-dynload/_locale.so'
> WARNING: QA Issue: No GNU_HASH in the elf binary: '/home/gtbldadm/yocto/mcsdk-3_00_00_11/oe-layersetup-mcsdk/build/arago-tmp-external-linaro-toolchain/work/armv7ahf-vfp-neon-oe-linux-gnueabi/python-2.7.3-r0.3/packages-split/python-codecs/usr/lib/python2.7/lib-dynload/_codecs_tw.so'
> WARNING: QA Issue: No GNU_HASH in the elf binary: '/home/gtbldadm/yocto/mcsdk-3_00_00_11/oe-layersetup-mcsdk/build/arago-tmp-external-linaro-toolchain/work/armv7ahf-vfp-neon-oe-linux-gnueabi/python-2.7.3-r0.3/packages-split/python-codecs/usr/lib/python2.7/lib-dynload/unicodedata.so'
> WARNING: QA Issue: No GNU_HASH in the elf binary: '/home/gtbldadm/yocto/mcsdk-3_00_00_11/oe-layersetup-mcsdk/build/arago-tmp-external-linaro-toolchain/work/armv7ahf-vfp-neon-oe-linux-gnueabi/python-2.7.3-r0.3/packages-split/python-codecs/usr/lib/python2.7/lib-dynload/_codecs_jp.so'
> WARNING: QA Issue: No GNU_HASH in the elf binary: '/home/gtbldadm/yocto/mcsdk-3_00_00_11/oe-layersetup-mcsdk/build/arago-tmp-external-linaro-toolchain/work/armv7ahf-vfp-neon-oe-linux-gnueabi/python-2.7.3-r0.3/packages-split/python-codecs/usr/lib/python2.7/lib-dynload/_multibytecodec.so'
> WARNING: QA Issue: No GNU_HASH in the elf binary: '/home/gtbldadm/yocto/mcsdk-3_00_00_11/oe-layersetup-mcsdk/build/arago-tmp-external-linaro-toolchain/work/armv7ahf-vfp-neon-oe-linux-gnueabi/python-2.7.3-r0.3/packages-split/python-codecs/usr/lib/python2.7/lib-dynload/_codecs_kr.so'
> WARNING: QA Issue: No GNU_HASH in the elf binary: '/home/gtbldadm/yocto/mcsdk-3_00_00_11/oe-layersetup-mcsdk/build/arago-tmp-external-linaro-toolchain/work/armv7ahf-vfp-neon-oe-linux-gnueabi/python-2.7.3-r0.3/packages-split/python-codecs/usr/lib/python2.7/lib-dynload/_codecs_cn.so'
> WARNING: QA Issue: No GNU_HASH in the elf binary: '/home/gtbldadm/yocto/mcsdk-3_00_00_11/oe-layersetup-mcsdk/build/arago-tmp-external-linaro-toolchain/work/armv7ahf-vfp-neon-oe-linux-gnueabi/python-2.7.3-r0.3/packages-split/python-codecs/usr/lib/python2.7/lib-dynload/_codecs_hk.so'
> WARNING: QA Issue: No GNU_HASH in the elf binary: '/home/gtbldadm/yocto/mcsdk-3_00_00_11/oe-layersetup-mcsdk/build/arago-tmp-external-linaro-toolchain/work/armv7ahf-vfp-neon-oe-linux-gnueabi/python-2.7.3-r0.3/packages-split/python-codecs/usr/lib/python2.7/lib-dynload/_codecs_iso2022.so'

> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago


