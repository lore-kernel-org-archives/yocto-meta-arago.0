Return-Path: <denys@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id 80467529E2
	for <meta-arago@arago-project.org>;
	Thu, 26 Sep 2013 17:36:28 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id r8QHaRRB023411;
	Thu, 26 Sep 2013 12:36:27 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id r8QHaRlw028609;
	Thu, 26 Sep 2013 12:36:27 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.2.342.3;
	Thu, 26 Sep 2013 12:36:27 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id r8QHaQdl030044;
	Thu, 26 Sep 2013 12:36:26 -0500
Date: Thu, 26 Sep 2013 13:36:26 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Sixten =?iso-8859-1?Q?Sj=F6str=F6m?= Thames
	<Sixten.Sjoestroem.Thames@enea.com>
Message-ID: <20130926173626.GY14528@edge>
References: <B0B361514883EA47B19C4FC8275640D125BC8137@sestoex09.enea.se>
MIME-Version: 1.0
In-Reply-To: <B0B361514883EA47B19C4FC8275640D125BC8137@sestoex09.enea.se>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>,
	"santosh.shilimkar@ti.com" <santosh.shilimkar@ti.com>
Subject: Re: NO_HZ and TI MCSDK 3.8.4 kernel for Keystone 2
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
X-List-Received-Date: Thu, 26 Sep 2013 17:36:28 -0000
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

In general, you need to subscribe to the mailing list to be able to post to 
it. But in this case, meta-arago is probably not the right list for you - are 
you trying to build an Arago distribution that is based on OpenEmbedded and 
the Yocto Project? If it's just the kernel question, then Santosh should be 
able to help you or point you in the right direction. Thanks.


On Wed, Sep 25, 2013 at 12:47:58PM +0000, Sixten Sjöström Thames wrote:
> Hi,
> 
> I'm interested in getting the CONFIG_NO_HZ_FULL kernel configuration 
> (http://lwn.net/Articles/549580/) to work with the MCSDK kernel for Keystone 
> 2 (http://arago-project.org/git/projects/?p=linux-keystone.git).
> 
> Some questions: Are there any plans to rebase the Keystone 2 BSP against a 
> newer Linux kernel version that supports NO_HZ_FULL (3.10 or later) in the 
> near future? Are there any available patches that enable the NO_HZ_FULL 
> configuration for the MCSDK 3.8.4 Linux kernel?
> 
> Best Regards,
> Sixten Sjöström Thames

> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago


