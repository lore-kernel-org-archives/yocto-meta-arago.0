Return-Path: <denys@ti.com>
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by arago-project.org (Postfix) with ESMTPS id DC7AC52987
	for <meta-arago@arago-project.org>;
	Fri, 14 Jun 2019 18:19:50 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x5EIJAvU012687
	for <meta-arago@arago-project.org>; Fri, 14 Jun 2019 13:19:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1560536350;
	bh=Tkzkv46YcDpCK/k1xFmEHljFbbIXLnHzewB7usssKEE=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=kYy/+2FsLOd9xBcDM8xGlbplyEwuBmd3CFEjRu2Uy/syAKQ6kX1oIhttghFD8JADv
	yJOVAm9jToNSF4NAYfuX358m8C2F7ipxR4Zpe20kqOsgSxYkcj8AjkQWMIYkI528hq
	hTjilMk0oYpU8GDMWM99aN9axh3o+/9jzkxwubdM=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x5EIJAro004029
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Fri, 14 Jun 2019 13:19:10 -0500
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE109.ent.ti.com
	(10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Fri, 14 Jun 2019 13:19:10 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE114.ent.ti.com
	(10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Fri, 14 Jun 2019 13:19:10 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x5EIJAit098784;
	Fri, 14 Jun 2019 13:19:10 -0500
Date: Fri, 14 Jun 2019 14:19:10 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Jacob Stiffler <j-stiffler@ti.com>
Message-ID: <20190614181910.GC31986@beryl>
References: <1560360603-34381-1-git-send-email-denys@ti.com>
	<713d4409-7cf5-5f69-ae6b-bfd4f6cd86ca@ti.com>
	<20190614181739.GB31986@beryl>
MIME-Version: 1.0
In-Reply-To: <20190614181739.GB31986@beryl>
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
X-List-Received-Date: Fri, 14 Jun 2019 18:19:51 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Fri, Jun 14, 2019 at 02:17:39PM -0400, Denys Dmytriyenko wrote:
> Still running it throught the next build, but it worked for am57 locally.

Ah, sorry, not this one, this was already tested. I was referring to glfw fix.


> On Fri, Jun 14, 2019 at 01:58:10PM -0400, Jacob Stiffler wrote:
> > Denys,
> > 
> > Can you backport this to ti2019.01?
> > 
> > 
> > Thank you,
> > 
> > Jake
> > 
> > 
> > On 6/12/2019 1:30 PM, Denys Dmytriyenko wrote:
> > >Fixes following QA error:
> > >ERROR: point-cloud-viewer-2.1-r1 do_package_qa: QA Issue: /usr/bin/point_cloud_viewer contained in package point-cloud-viewer requires libxkbcommon.so.0, but no providers found in RDEPENDS_point-cloud-viewer? [file-rdeps]
> > >
> > >Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> > >---
> > >  .../recipes-apps/point-cloud-viewer/point-cloud-viewer_git.bb           | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > >
> > >diff --git a/meta-arago-extras/recipes-apps/point-cloud-viewer/point-cloud-viewer_git.bb b/meta-arago-extras/recipes-apps/point-cloud-viewer/point-cloud-viewer_git.bb
> > >index 9ee4ff0..067ead9 100644
> > >--- a/meta-arago-extras/recipes-apps/point-cloud-viewer/point-cloud-viewer_git.bb
> > >+++ b/meta-arago-extras/recipes-apps/point-cloud-viewer/point-cloud-viewer_git.bb
> > >@@ -17,7 +17,7 @@ PV = "2.1"
> > >  S = "${WORKDIR}/git"
> > >-RDEPENDS_${PN} = "glfw opencv libstdc++"
> > >+RDEPENDS_${PN} = "glfw opencv libxkbcommon"
> > >  do_install() {
> > >      install -d ${D}${bindir}
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

