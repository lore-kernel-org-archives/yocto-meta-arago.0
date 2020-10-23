Return-Path: <denys@ti.com>
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by arago-project.org (Postfix) with ESMTPS id 6503452999
	for <meta-arago@arago-project.org>;
	Fri, 23 Oct 2020 17:37:35 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 09NHYU2o119962
	for <meta-arago@arago-project.org>; Fri, 23 Oct 2020 12:34:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1603474470;
	bh=h1ZrVZ0FiPhYHUcXuC3UgGkJL3wHbORq7GWxYRrRGxs=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=ho2v3PzQ7z8lfHXR4vgdga28GtDtK5nlaKmdSXnbcQPSXSI0WIJ2s55kFoJqVoDFJ
	1/1TLXVkoiEL9Kx9ZUaWUJPAYUlnEkWfooXmMfB1Etu/DXucTs/NLVBfRkshFnSaCM
	+V5K3uicwb1KAGJSkm29uELe9kKDyTm8wbyZJIFI=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 09NHYUk9086186
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Fri, 23 Oct 2020 12:34:30 -0500
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE109.ent.ti.com
	(10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3;
	Fri, 23 Oct 2020 12:34:30 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE103.ent.ti.com
	(10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
	Frontend Transport; Fri, 23 Oct 2020 12:34:29 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 09NHYTaa077334;
	Fri, 23 Oct 2020 12:34:29 -0500
Date: Fri, 23 Oct 2020 13:34:29 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Dan Murphy <dmurphy@ti.com>
Message-ID: <20201023173429.GR19741@beryl>
References: <20201022115052.7711-1-g-tammana@ti.com>
	<2ec10b3b-73fc-3bb2-8c26-fbb512665f24@ti.com>
	<20201023173127.GQ19741@beryl>
MIME-Version: 1.0
In-Reply-To: <20201023173127.GQ19741@beryl>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-arago@arago-project.org
Subject: Re: [dunfell/master][PATCH] cairo: enable gles2 support
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
X-List-Received-Date: Fri, 23 Oct 2020 17:37:35 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Fri, Oct 23, 2020 at 01:31:27PM -0400, Denys Dmytriyenko wrote:
> On Fri, Oct 23, 2020 at 11:20:26AM -0500, Dan Murphy wrote:
> > Gowtham
> > 
> > On 10/22/20 6:50 AM, Gowtham Tammana wrote:
> > >add gles2 support for devices which can support it.
> > >
> > >Signed-off-by: Gowtham Tammana <g-tammana@ti.com>
> > >---
> > >  meta-arago-distro/recipes-graphics/cairo/cairo_%.bbappend | 3 +++
> > >  1 file changed, 3 insertions(+)
> > >  create mode 100644 meta-arago-distro/recipes-graphics/cairo/cairo_%.bbappend
> > >
> > >diff --git a/meta-arago-distro/recipes-graphics/cairo/cairo_%.bbappend b/meta-arago-distro/recipes-graphics/cairo/cairo_%.bbappend
> > >new file mode 100644
> > >index 00000000..3d67bb6a
> > >--- /dev/null
> > >+++ b/meta-arago-distro/recipes-graphics/cairo/cairo_%.bbappend
> > >@@ -0,0 +1,3 @@
> > >+PR_append = ".arago1"
> > >+
> > >+PACKAGECONFIG_append = " ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'egl glesv2', '', d)}"
> > 
> > For completeness this patch breaks K2 builds as we discussed off line.
> 
> Probably also need to check for "gpu" in MACHINE_FEATURES?

Also, if PACKAGECONFIG is the only change you are making, it may be better to 
do it in arago.conf distro config, instead of creating a new bbappend - see 
arago.conf for a bunch of other PACKAGECONFIG settings there.

-- 
Denys

