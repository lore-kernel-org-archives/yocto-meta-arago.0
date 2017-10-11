Return-Path: <denys@ti.com>
Received: from lelnx194.ext.ti.com (lelnx194.ext.ti.com [198.47.27.80])
	by arago-project.org (Postfix) with ESMTPS id ECCD852961
	for <meta-arago@arago-project.org>;
	Wed, 11 Oct 2017 18:07:28 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelnx194.ext.ti.com (8.15.1/8.15.1) with ESMTP id v9BI7SrP006414
	for <meta-arago@arago-project.org>; Wed, 11 Oct 2017 13:07:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1507745248;
	bh=0rNMyjDjpQx/Kc6tBsjwmCmm/Fg3Wala/03N59q8AT8=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=JHDnnLNiBEJpiL7hqcDXPabCe0bmXsZyI2IJTtZ5kb/gKumxgQ9Nz3GsRE78YEZtV
	rqKmy/9n8vUf8WNBBgJUkL98ScnDtv9zA++yT/MKymzqUVuF3o1Ts7oNRL+BOSclfM
	C+ZwxgI1bUqqGDEsWh7LyMJS401PIE2EYgAkeNWc=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id v9BI7SGt027286
	for <meta-arago@arago-project.org>; Wed, 11 Oct 2017 13:07:28 -0500
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE109.ent.ti.com
	(10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.845.34;
	Wed, 11 Oct 2017 13:07:28 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE115.ent.ti.com
	(10.64.6.36) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.845.34 via Frontend
	Transport; Wed, 11 Oct 2017 13:07:28 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id v9BI7Sh4009698;
	Wed, 11 Oct 2017 13:07:28 -0500
Date: Wed, 11 Oct 2017 14:07:13 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Jean-Jacques Hiblot <jjhiblot@ti.com>
Message-ID: <20171011180712.GV16210@edge>
References: <1507744725-32713-1-git-send-email-jjhiblot@ti.com>
	<20171011180207.GU16210@edge>
	<d8ba8fb8-5ae4-ff28-0de7-3a69c5871630@ti.com>
MIME-Version: 1.0
In-Reply-To: <d8ba8fb8-5ae4-ff28-0de7-3a69c5871630@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-arago@arago-project.org
Subject: Re: [krogoth] [PATCH 1/2] can-utils: update to the latest
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
X-List-Received-Date: Wed, 11 Oct 2017 18:07:29 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

No need, I'll merge them as is.

On Wed, Oct 11, 2017 at 08:05:06PM +0200, Jean-Jacques Hiblot wrote:
> On 11/10/2017 20:02, Denys Dmytriyenko wrote:
> >Are these 2 backports from morty? Please keep original commit logs then.
> Yes they are backports from morty?
> 
> Do you want me to resend?
> 
> JJ
> 
> >
> >
> >On Wed, Oct 11, 2017 at 07:58:44PM +0200, Jean-Jacques Hiblot wrote:
> >>Signed-off-by: Jean-Jacques Hiblot <jjhiblot@ti.com>
> >>---
> >>  meta-arago-distro/recipes-extended/socketcan/can-utils_git.bbappend | 3 +++
> >>  1 file changed, 3 insertions(+)
> >>  create mode 100644 meta-arago-distro/recipes-extended/socketcan/can-utils_git.bbappend
> >>
> >>diff --git a/meta-arago-distro/recipes-extended/socketcan/can-utils_git.bbappend b/meta-arago-distro/recipes-extended/socketcan/can-utils_git.bbappend
> >>new file mode 100644
> >>index 0000000..c0e6666
> >>--- /dev/null
> >>+++ b/meta-arago-distro/recipes-extended/socketcan/can-utils_git.bbappend
> >>@@ -0,0 +1,3 @@
> >>+SRCREV = "5b518a0a5fa56856f804372a6b99b518dedb5386"
> >>+
> >>+PR_append = ".arago0"
> >>-- 
> >>1.9.1
> >>
> 

