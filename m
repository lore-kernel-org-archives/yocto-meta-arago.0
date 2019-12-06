Return-Path: <denys@ti.com>
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by arago-project.org (Postfix) with ESMTPS id 60AF4529B5
	for <meta-arago@arago-project.org>;
	Fri,  6 Dec 2019 20:50:11 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id xB6KmcV1077870;
	Fri, 6 Dec 2019 14:48:38 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1575665318;
	bh=EHUNvjSNHav+rovzrWk8Wm8LiHHALNQs0R/4tH0cnCQ=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=Kxtmio6haPwF+TE+ST3mVRUrPpO01wbRiGJhQxWXwiQKw1Kspls09cWLEwfW1B1Uh
	JqdfGIKSh39nXa4wXy8kRUTIcnTFuCg5lkoPlAvUh9gqEFwQzzSTctYW2Wu7yteOxT
	t31klTLGoiXiCGeSkReW1Sn8/6xdxEelN4LSTIXs=
Received: from DFLE107.ent.ti.com (dfle107.ent.ti.com [10.64.6.28])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xB6KmccF072506
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 6 Dec 2019 14:48:38 -0600
Received: from DFLE102.ent.ti.com (10.64.6.23) by DFLE107.ent.ti.com
	(10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3;
	Fri, 6 Dec 2019 14:48:37 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE102.ent.ti.com
	(10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
	Frontend Transport; Fri, 6 Dec 2019 14:48:37 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id xB6KmbNM010320;
	Fri, 6 Dec 2019 14:48:37 -0600
Date: Fri, 6 Dec 2019 15:48:37 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: hari n <hnagalla@gmail.com>
Message-ID: <20191206204837.GA24609@beryl>
References: <20191206201935.GX24609@beryl>
	<6C895589-06CD-44D1-8FA4-3A9500934474@gmail.com>
MIME-Version: 1.0
In-Reply-To: <6C895589-06CD-44D1-8FA4-3A9500934474@gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-arago@arago-project.org
Subject: Re: [ 1/1] Use wireless-regdb-static for K4.15 and later
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
X-List-Received-Date: Fri, 06 Dec 2019 20:50:11 -0000
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

Hari,

Ok, sounds good. Can you please remove "uim-sysfs" from the packagegroup, so I 
can drop the recipe completely from meta-ti later on? Thanks!

Denys


On Fri, Dec 06, 2019 at 02:29:09PM -0600, hari n wrote:
> Hi Denys,
> 
> It is not needed. We do not need uim, as we moved away from shared 
> transport.
> 
> In v1, I used the tisdk6.1 snapshot repository. This time, I pulled using 
> the thud configuration.
> 
> Thanks
> Hari
> 
> 
> > On Dec 6, 2019, at 2:19 PM, Denys Dmytriyenko <denys@ti.com> wrote:
> > 
> > ﻿So, is "uim" still needed or not? In v1 you tried to remove it, but it got 
> > renamed to "uim-sysfs" to avoid confusion with other uim package. I'm just 
> > trying to see if we still need it or can simply drop the recipe from meta-ti.
> > 
> > Denys
> > 
> > 
> >> On Fri, Dec 06, 2019 at 02:16:38PM -0600, Hari Nagalla wrote:
> >> ---
> >> .../packagegroups/packagegroup-arago-tisdk-connectivity.bb    | 4 ++--
> >> 1 file changed, 2 insertions(+), 2 deletions(-)
> >> 
> >> diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-connectivity.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-connectivity.bb
> >> index 72b72d6c..a44c4063 100644
> >> --- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-connectivity.bb
> >> +++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-connectivity.bb
> >> @@ -8,13 +8,13 @@ inherit packagegroup
> >> 
> >> # WLAN support packages.
> >> # These are the packages that all platforms use for WLAN support
> >> -# add wireless-regdb
> >> +# add wireless-regdb-static
> >> WLAN_COMMON = "\
> >>     iw \
> >>     softap-udhcpd-config \
> >>     eventdump \
> >>     wlconf \
> >> -    wireless-regdb \
> >> +    wireless-regdb-static \
> >>     linux-firmware-iwlwifi-8000c \
> >>     linux-firmware-iwlwifi-8265 \
> >>     linux-firmware-iwlwifi-3160-17 \
> >> -- 
> >> 2.17.1
> >> 
> >> _______________________________________________
> >> meta-arago mailing list
> >> meta-arago@arago-project.org
> >> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

