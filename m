Return-Path: <denys@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id 89A8752A53
	for <meta-arago@arago-project.org>;
	Sat, 17 Aug 2013 15:00:04 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id r7HF03Be011364;
	Sat, 17 Aug 2013 10:00:03 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id r7HF03Uw002680;
	Sat, 17 Aug 2013 10:00:03 -0500
Received: from dlelxv22.itg.ti.com (172.17.1.197) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.2.342.3;
	Sat, 17 Aug 2013 10:00:02 -0500
Received: from localhost (gtudedge.gt.design.ti.com [158.218.102.158])	by
	dlelxv22.itg.ti.com (8.13.8/8.13.8) with ESMTP id r7HF02Op025053;
	Sat, 17 Aug 2013 10:00:02 -0500
Date: Sat, 17 Aug 2013 11:00:02 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Christian Gagneraud <chgans@gna.org>
Message-ID: <20130817150001.GD4931@edge>
References: <520D8F5A.4000904@gna.org>
MIME-Version: 1.0
In-Reply-To: <520D8F5A.4000904@gna.org>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org
Subject: Re: u-boot-ti-staging failed to compile
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
X-List-Received-Date: Sat, 17 Aug 2013 15:00:04 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Fri, Aug 16, 2013 at 02:32:58PM +1200, Christian Gagneraud wrote:
> Hi there,
> 
> I've started a brand new build today using arago-dylan-config.txt, I
> got a build failure with u-boot-ti-staging, the whole log is on
> pastebin [1].
> In short, I got:
> make[2]: *** No rule to make target `include/config_cmd_defaults',
> needed by `spl/arch/arm/cpu/armv7/cache_v7.o'.  Stop.

Hmm, I haven't seen that one before. I'm building dylan for am335x-evm and it 
includes u-boot-ti-staging that has no issues. What toolchain do you use?

-- 
Denys

> Path have been stripped down for readability.
> 
> $ find sources/meta-{arago,ti} -name '*boot-ti-*'
> sources/meta-arago/meta-arago-distro/recipes-bsp/u-boot/u-boot-ti-staging_2013.01.01.bbappend
> sources/meta-ti/recipes-bsp/u-boot/u-boot-ti-staging_2013.01.01.bb
> sources/meta-ti/recipes-bsp/u-boot/u-boot-ti.inc
> 
> Any thoughts one this one?
> 
> Regards,
> Chris
> 
> [1] http://pastebin.com/HGX8i5Uk
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

