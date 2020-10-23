Return-Path: <denys@ti.com>
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by arago-project.org (Postfix) with ESMTPS id 8B9D452999
	for <meta-arago@arago-project.org>;
	Fri, 23 Oct 2020 17:34:33 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 09NHVSJb119072
	for <meta-arago@arago-project.org>; Fri, 23 Oct 2020 12:31:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1603474288;
	bh=etEde6Sbx9+D1JT6jYEUE2nc+fA9jWnzPtFLazkUsig=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=F1pShLtXjz30Cl72p2Uqe2sXWlerimsRA1slx2tEdXAofMgBjFBLVK0vG2DdLFh9T
	HSk+3PsVsteA6jO5o9whSAxcXNcMMqe5R3hEdaEsNwfUfU05ZXtNHHy0HFj9hmMuRB
	vWEU3rZNoLaSi1EJ8W7+ow6KMII5Iw5dSVrlfiqc=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 09NHVSNC075244
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Fri, 23 Oct 2020 12:31:28 -0500
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE115.ent.ti.com
	(157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3;
	Fri, 23 Oct 2020 12:31:27 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE109.ent.ti.com
	(157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
	Frontend Transport; Fri, 23 Oct 2020 12:31:27 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 09NHVRkN071263;
	Fri, 23 Oct 2020 12:31:27 -0500
Date: Fri, 23 Oct 2020 13:31:27 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Dan Murphy <dmurphy@ti.com>
Message-ID: <20201023173127.GQ19741@beryl>
References: <20201022115052.7711-1-g-tammana@ti.com>
	<2ec10b3b-73fc-3bb2-8c26-fbb512665f24@ti.com>
MIME-Version: 1.0
In-Reply-To: <2ec10b3b-73fc-3bb2-8c26-fbb512665f24@ti.com>
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
X-List-Received-Date: Fri, 23 Oct 2020 17:34:33 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Fri, Oct 23, 2020 at 11:20:26AM -0500, Dan Murphy wrote:
> Gowtham
> 
> On 10/22/20 6:50 AM, Gowtham Tammana wrote:
> >add gles2 support for devices which can support it.
> >
> >Signed-off-by: Gowtham Tammana <g-tammana@ti.com>
> >---
> >  meta-arago-distro/recipes-graphics/cairo/cairo_%.bbappend | 3 +++
> >  1 file changed, 3 insertions(+)
> >  create mode 100644 meta-arago-distro/recipes-graphics/cairo/cairo_%.bbappend
> >
> >diff --git a/meta-arago-distro/recipes-graphics/cairo/cairo_%.bbappend b/meta-arago-distro/recipes-graphics/cairo/cairo_%.bbappend
> >new file mode 100644
> >index 00000000..3d67bb6a
> >--- /dev/null
> >+++ b/meta-arago-distro/recipes-graphics/cairo/cairo_%.bbappend
> >@@ -0,0 +1,3 @@
> >+PR_append = ".arago1"
> >+
> >+PACKAGECONFIG_append = " ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'egl glesv2', '', d)}"
> 
> For completeness this patch breaks K2 builds as we discussed off line.

Probably also need to check for "gpu" in MACHINE_FEATURES?

