Return-Path: <nikhil.nd@ti.com>
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by arago-project.org (Postfix) with ESMTPS id CBA5A52986
	for <meta-arago@arago-project.org>;
	Tue, 27 Oct 2020 10:14:36 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 09RABUnO001222
	for <meta-arago@arago-project.org>; Tue, 27 Oct 2020 05:11:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1603793490;
	bh=1nEmg4PZD9e9kJg2XfFbyzCJKDpDJHTOGkFGgGf5h0E=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=WFCIDDf7Nd+1Skac4RNYIzgIUQjuI1owGNkA3AyWNO+P2S5nd2qI0943y0pMvZcjv
	o3S8EGLaJrFBXFbq5675cLae7QxwuojGWCJ4Yn0o4kDxtcxvMH8bTqfK8puaDu+2/w
	MVGOpyYN3etYA/r1jW7XJ/Dop6Oz9uOxLtr05vcA=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 09RABUZU113948
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Tue, 27 Oct 2020 05:11:30 -0500
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE112.ent.ti.com
	(10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3;
	Tue, 27 Oct 2020 05:11:30 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE114.ent.ti.com
	(10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
	Frontend Transport; Tue, 27 Oct 2020 05:11:30 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 09RABSi6058739;
	Tue, 27 Oct 2020 05:11:29 -0500
Date: Tue, 27 Oct 2020 15:41:28 +0530
From: Nikhil Devshatwar <nikhil.nd@ti.com>
To: Dan Murphy <dmurphy@ti.com>
Message-ID: <20201027101128.p2ub37j5ycztmzm6@NiksLab>
References: <20201026155125.31513-1-nikhil.nd@ti.com>
	<1cfdbbf2-80e3-29b6-02f0-c6ef9b332168@ti.com>
MIME-Version: 1.0
In-Reply-To: <1cfdbbf2-80e3-29b6-02f0-c6ef9b332168@ti.com>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-arago@arago-project.org, aparnab@ti.com
Subject: Re: [dunfell PATCH 1/2] websocketd: Add new recipe
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
X-List-Received-Date: Tue, 27 Oct 2020 10:14:37 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On 11:09-20201026, Dan Murphy wrote:
> Nikhil
> 
> On 10/26/20 10:51 AM, Nikhil Devshatwar wrote:
> > websocketd is an application which allows to redirect output of
> > command line applications via a websocket so that web pages can
> > interact with them.
> > 
> > This is very useful for visualizing statistics information on
> > host machine browser.
> > 
> > Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
> > ---
> >   .../recipes-devtools/websocketd/websocketd.bb    | 16 ++++++++++++++++
> >   1 file changed, 16 insertions(+)
> >   create mode 100644 meta-arago-extras/recipes-devtools/websocketd/websocketd.bb
> > 
> > diff --git a/meta-arago-extras/recipes-devtools/websocketd/websocketd.bb b/meta-arago-extras/recipes-devtools/websocketd/websocketd.bb
> > new file mode 100644
> > index 00000000..44f549ee
> > --- /dev/null
> > +++ b/meta-arago-extras/recipes-devtools/websocketd/websocketd.bb
> > @@ -0,0 +1,16 @@
> > +SUMMARY = "Application for routing native applications via websockets"
> > +HOMEPAGE = "http://websocketd.com/"
> > +
> > +LICENSE = "BSD-2-Clause"
> > +LIC_FILES_CHKSUM = "file://LICENSE;md5=a14d7befdbee1290ac5c472cd85d66f2"
> > +
> > +PV = "0.3.0"
> 0.3.1 is available
> > +SRC_URI = "https://github.com/joewalnes/websocketd/releases/download/v${PV}/websocketd-${PV}-linux_arm64.zip"
> 
> Is this valid for ARM32? Does this build for am3 or am4?
> 
> I see websocketd-0.3.1-linux_arm.zip available for 32 bit

This is planned to be supported only for K3 platforms.
I haven't run it on any arm32 platforms.
Should I add a compatible machine here and in the statcol recipe as well?
> 
> > +SRC_URI[md5sum] = "968c1ce4ed4fe5f86817f2533f5d3004"
> > +
> > +S = "${WORKDIR}"
> > +
> > +do_install() {
> > +	install -d ${D}/${bindir}
> > +	install -m 0755 ${S}/websocketd ${D}${bindir}/
> > +}

