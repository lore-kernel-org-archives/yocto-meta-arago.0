Return-Path: <denys@ti.com>
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by arago-project.org (Postfix) with ESMTPS id 685EA529A4
	for <meta-arago@arago-project.org>;
	Wed, 21 Oct 2020 18:34:38 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 09LIVXou057887
	for <meta-arago@arago-project.org>; Wed, 21 Oct 2020 13:31:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1603305093;
	bh=Oui8GomC9xOcwtwlDJMOz0W3XdnQUgbD4lwHj1IOgMA=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=AiaMix5JHSOXBpFq3Qu6ndeWbbkzdAEefyiiq/14h7TSYSL1k5KwdUGaskUU9GGCX
	Sm4l2LiPFtVO5e1AwsKfSbYv5oratBF18rdOYVWxM507hIU8mgQz5+wBP4VzHu5Kvi
	Co0wpL9WghOWjNCJaYtlLTgVqNclXDaWt7djb43Y=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 09LIVXYb084679
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Wed, 21 Oct 2020 13:31:33 -0500
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE113.ent.ti.com
	(10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3;
	Wed, 21 Oct 2020 13:31:33 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE105.ent.ti.com
	(10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
	Frontend Transport; Wed, 21 Oct 2020 13:31:33 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 09LIVXpk089812;
	Wed, 21 Oct 2020 13:31:33 -0500
Date: Wed, 21 Oct 2020 14:31:32 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Suman Anna <s-anna@ti.com>
Message-ID: <20201021183132.GT14852@beryl>
References: <20201021175306.13253-1-s-anna@ti.com>
	<20201021180056.GR14852@beryl>
	<6bbac038-986b-abd9-fe2a-3ccded5027f7@ti.com>
MIME-Version: 1.0
In-Reply-To: <6bbac038-986b-abd9-fe2a-3ccded5027f7@ti.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-arago@arago-project.org
Subject: Re: [master/dunfell PATCH] packagegroup-*-addons: add ti-rpmsg-char for all K3 platforms
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
X-List-Received-Date: Wed, 21 Oct 2020 18:34:38 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Wed, Oct 21, 2020 at 01:27:38PM -0500, Suman Anna wrote:
> Hi Denys,
> 
> On 10/21/20 1:00 PM, Denys Dmytriyenko wrote:
> > On Wed, Oct 21, 2020 at 12:53:06PM -0500, Suman Anna wrote:
> >> libti_rpmsg_char is a new utility library providing a simple API for
> >> applications wanting to talk to remote processors over the rpmsg_char
> >> Linux kernel driver with virtio-rpmsg back-end transport.
> >>
> >> Add this library and examples for all the K3 platforms. It does not
> >> support legacy SoCs at the moment, but this can be adjusted later on
> >> when the support for the same is added to the library.
> >>
> >> Signed-off-by: Suman Anna <s-anna@ti.com>
> >> Signed-off-by: Gowtham Tammana <g-tammana@ti.com>
> >> ---
> >>  .../packagegroups/packagegroup-arago-tisdk-addons-sdk-host.bb | 3 ++-
> >>  .../packagegroups/packagegroup-arago-tisdk-addons.bb          | 4 +++-
> >>  2 files changed, 5 insertions(+), 2 deletions(-)
> >>
> >> diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-host.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-host.bb
> >> index 46817f999894..914fa07bf705 100644
> >> --- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-host.bb
> >> +++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-host.bb
> >> @@ -1,6 +1,6 @@
> >>  DESCRIPTION = "Task to install sources for additional utilities/demos for SDKs"
> >>  LICENSE = "MIT"
> >> -PR = "r36"
> >> +PR = "r37"
> >>  
> >>  PACKAGE_ARCH = "${MACHINE_ARCH}"
> >>  
> >> @@ -40,6 +40,7 @@ UTILS_append_k3 = " \
> >>      jailhouse-src \
> >>      ti-sci-fw-source \
> >>      trusted-firmware-a-src \
> >> +    ti-rpmsg-char-src \
> > 
> > This won't work ^^^
> 
> Alright, I will drop this.

If you need -src package generated, you'd need to update arago-source-ipk.inc 
in the conf/


> regards
> Suman
> 
> > 
> > 
> >>  "
> >>  
> >>  UTILS_append_j7-evm = " \
> >> diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
> >> index e2c3774a287a..adfd45f2af11 100644
> >> --- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
> >> +++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
> >> @@ -1,6 +1,6 @@
> >>  DESCRIPTION = "Task to install additional utilities/demos for SDKs"
> >>  LICENSE = "MIT"
> >> -PR = "r77"
> >> +PR = "r78"
> >>  
> >>  PACKAGE_ARCH = "${MACHINE_ARCH}"
> >>  
> >> @@ -72,6 +72,8 @@ UTILS_append_k3 = " mmc-utils \
> >>                      switch-config \
> >>                      irqbalance \
> >>                      jailhouse \
> >> +                    ti-rpmsg-char \
> >> +                    ti-rpmsg-char-examples \
> >>  "
> >>  
> >>  UTILS_append_am65xx = " ti-rtos-firmware pru-icss pru-pwm-fw"
> >> -- 
> >> 2.28.0
> >>
> 

