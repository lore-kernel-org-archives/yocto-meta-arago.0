Return-Path: <denys@ti.com>
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by arago-project.org (Postfix) with ESMTPS id D62B6520C0
	for <meta-arago@arago-project.org>;
	Fri, 14 Jun 2019 18:18:20 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x5EIHeOO081698
	for <meta-arago@arago-project.org>; Fri, 14 Jun 2019 13:17:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1560536260;
	bh=smrgV9LvmnwRsT+7l/NSGOAdi8htjdiHI1WEdMMNQTs=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=i3McNZcl0TnLfrk5t9I32Z7e5VMAI3JAK+LBnXF7QttNq0FuvxTLUmbb1FtAqmFzV
	+CthucBcLucGsIj6iDqfhfgQkvw0uec06gNI3EgtC6bHxbWOORxye51Pz7thMZzsCl
	uZmi98VhzZ00rdbzswzwYD7aWiYBu8bdTTRoY/YI=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x5EIHeti080954
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Fri, 14 Jun 2019 13:17:40 -0500
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE113.ent.ti.com
	(10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Fri, 14 Jun 2019 13:17:40 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE105.ent.ti.com
	(10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Fri, 14 Jun 2019 13:17:40 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x5EIHd8p068310;
	Fri, 14 Jun 2019 13:17:40 -0500
Date: Fri, 14 Jun 2019 14:17:39 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Jacob Stiffler <j-stiffler@ti.com>
Message-ID: <20190614181739.GB31986@beryl>
References: <1560360603-34381-1-git-send-email-denys@ti.com>
	<713d4409-7cf5-5f69-ae6b-bfd4f6cd86ca@ti.com>
MIME-Version: 1.0
In-Reply-To: <713d4409-7cf5-5f69-ae6b-bfd4f6cd86ca@ti.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-arago@arago-project.org
Subject: Re: [EXTERNAL] [thud/master][PATCH] point-cloud-viewer: add RDEPENDS on libxkbcommon
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
X-List-Received-Date: Fri, 14 Jun 2019 18:18:21 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Still running it throught the next build, but it worked for am57 locally.

On Fri, Jun 14, 2019 at 01:58:10PM -0400, Jacob Stiffler wrote:
> Denys,
> 
> Can you backport this to ti2019.01?
> 
> 
> Thank you,
> 
> Jake
> 
> 
> On 6/12/2019 1:30 PM, Denys Dmytriyenko wrote:
> >Fixes following QA error:
> >ERROR: point-cloud-viewer-2.1-r1 do_package_qa: QA Issue: /usr/bin/point_cloud_viewer contained in package point-cloud-viewer requires libxkbcommon.so.0, but no providers found in RDEPENDS_point-cloud-viewer? [file-rdeps]
> >
> >Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> >---
> >  .../recipes-apps/point-cloud-viewer/point-cloud-viewer_git.bb           | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> >diff --git a/meta-arago-extras/recipes-apps/point-cloud-viewer/point-cloud-viewer_git.bb b/meta-arago-extras/recipes-apps/point-cloud-viewer/point-cloud-viewer_git.bb
> >index 9ee4ff0..067ead9 100644
> >--- a/meta-arago-extras/recipes-apps/point-cloud-viewer/point-cloud-viewer_git.bb
> >+++ b/meta-arago-extras/recipes-apps/point-cloud-viewer/point-cloud-viewer_git.bb
> >@@ -17,7 +17,7 @@ PV = "2.1"
> >  S = "${WORKDIR}/git"
> >-RDEPENDS_${PN} = "glfw opencv libstdc++"
> >+RDEPENDS_${PN} = "glfw opencv libxkbcommon"
> >  do_install() {
> >      install -d ${D}${bindir}

