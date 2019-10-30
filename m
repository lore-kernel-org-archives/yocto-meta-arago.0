Return-Path: <denys@ti.com>
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by arago-project.org (Postfix) with ESMTPS id 6EBAA529E8
	for <meta-arago@arago-project.org>;
	Wed, 30 Oct 2019 14:54:49 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x9UErT8D113430
	for <meta-arago@arago-project.org>; Wed, 30 Oct 2019 09:53:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1572447209;
	bh=/vvNFyMhs4BF7ThH200JocHHVvkjslC9eq3eME1oKQo=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=fmex0ONZhmkstLelwjp48FQwqL6E+Fj1qNYKodGoK/hZbja6m6oQ5++Wyp9DcOY1t
	GpjM/9O45EWkxPVTS0DDrNe0jZR4TNvNvSm3TZK5wAt3RZUb0erhpcM90+rWoQ/tE2
	lseyUfoa8ABnGgPP7DkLvUoGtdn/yxvjkPDQYOXs=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x9UErTBG115508
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Wed, 30 Oct 2019 09:53:29 -0500
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE112.ent.ti.com
	(10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Wed, 30 Oct 2019 09:53:16 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE112.ent.ti.com
	(10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Wed, 30 Oct 2019 09:53:16 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x9UErQMV069706;
	Wed, 30 Oct 2019 09:53:28 -0500
Date: Wed, 30 Oct 2019 10:53:25 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: "Ruei, Eric" <a0850410@ti.com>
Message-ID: <20191030145324.GO7518@beryl>
References: <20191029135521.42434-1-e-ruei1@ti.com>
	<20191029211102.GH7518@beryl>
	<07fbb684-289e-3dad-ab9b-8a260d4a1511@ti.com>
MIME-Version: 1.0
In-Reply-To: <07fbb684-289e-3dad-ab9b-8a260d4a1511@ti.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-arago@arago-project.org
Subject: Re: [PATCH] libepoxy: specify x11 as false explicitly when config option x11 not used
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
X-List-Received-Date: Wed, 30 Oct 2019 14:54:49 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Wed, Oct 30, 2019 at 10:49:30AM -0400, Ruei, Eric wrote:
> On 10/29/2019 5:11 PM, Denys Dmytriyenko wrote:
> >On Tue, Oct 29, 2019 at 09:55:21AM -0400, Eric Ruei wrote:
> >>This is required because the default value of x11 is true if not specified.
> >>
> >>Upstream Status: Accepted
> >
> >Wrong use of Upstream-Status. What you want to say is that this change is
> >already in upstream master/zeus and is only needed temporarily in thud.
> >
> >
> Denys:
> 
> What you mean is that I should not use Upstream-Status here and I should
> just add "this change is already in upstream master/zeus and is only needed
> temporarily in thud" in the description, right?

Correct. Upstream-Status is for patches we carry, not for recipes or bbappends.


> Eric
> 
> 
> >>glneo authored and rpurdie committed Sep 13, 2019
> >>
> >>Signed-off-by: Andrew F. Davis <afd@ti.com>
> >>Signed-off by: Richard Purdie <richard.purdie@linuxfoundation.org>
> >>Signed-off-by: Eric Ruei <e-ruei1@ti.com>
> >>---
> >>  .../recipes-graphics/libepoxy/libepoxy_%.bbappend              | 3 +++
> >>  1 file changed, 3 insertions(+)
> >>  create mode 100755 meta-arago-distro/recipes-graphics/libepoxy/libepoxy_%.bbappend
> >>
> >>diff --git a/meta-arago-distro/recipes-graphics/libepoxy/libepoxy_%.bbappend b/meta-arago-distro/recipes-graphics/libepoxy/libepoxy_%.bbappend
> >>new file mode 100755
> >>index 00000000..15c373cd
> >>--- /dev/null
> >>+++ b/meta-arago-distro/recipes-graphics/libepoxy/libepoxy_%.bbappend
> >>@@ -0,0 +1,3 @@
> >>+PR_append = ".arago0"
> >>+
> >>+PACKAGECONFIG[x11] = "-Dglx=yes, -Dglx=no -Dx11=false, virtual/libx11 virtual/libgl"
> >>-- 
> >>2.17.1
> >>
> >>_______________________________________________
> >>meta-arago mailing list
> >>meta-arago@arago-project.org
> >>http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
> 

