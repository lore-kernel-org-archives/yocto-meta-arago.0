Return-Path: <denys@ti.com>
Received: from fllnx210.ext.ti.com (fllnx210.ext.ti.com [198.47.19.17])
	by arago-project.org (Postfix) with ESMTPS id DFC2352961
	for <meta-arago@arago-project.org>;
	Wed, 11 Oct 2017 18:24:13 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllnx210.ext.ti.com (8.15.1/8.15.1) with ESMTP id v9BIOC1P012842
	for <meta-arago@arago-project.org>; Wed, 11 Oct 2017 13:24:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1507746252;
	bh=TYZs+GSoGV1cMnyRLfErPzeTlxekbJ85ThSedU+ZJ3M=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=v3JJvtL/vd4rw/q7l/FmVcFGUQ1TE5J51Ku289oQqcJ/5FNh39L2NEmC+8DIT0q/z
	nzC1FXA1ZW4e+dAE+H7hn9dlYEapmLqHBSOWGdaeGW50oFjwALiBCsFJZryAE+CbWC
	fdLZRYxmLKdD9HD3ddm/CV3IwKAprCfArM4rh1Oo=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v9BIOCMF007073
	for <meta-arago@arago-project.org>; Wed, 11 Oct 2017 13:24:12 -0500
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE109.ent.ti.com
	(157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.845.34;
	Wed, 11 Oct 2017 13:24:12 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE102.ent.ti.com
	(157.170.170.32) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.845.34 via Frontend
	Transport; Wed, 11 Oct 2017 13:24:12 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id v9BIOCRD026708;
	Wed, 11 Oct 2017 13:24:12 -0500
Date: Wed, 11 Oct 2017 14:23:56 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Jean-Jacques Hiblot <jjhiblot@ti.com>
Message-ID: <20171011182356.GX16210@edge>
References: <1507744725-32713-1-git-send-email-jjhiblot@ti.com>
	<20171011180207.GU16210@edge>
	<d8ba8fb8-5ae4-ff28-0de7-3a69c5871630@ti.com>
	<20171011180712.GV16210@edge>
	<b83b4c7e-52e2-14b9-d059-cf42c05d8096@ti.com>
MIME-Version: 1.0
In-Reply-To: <b83b4c7e-52e2-14b9-d059-cf42c05d8096@ti.com>
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
X-List-Received-Date: Wed, 11 Oct 2017 18:24:16 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Wed, Oct 11, 2017 at 08:10:45PM +0200, Jean-Jacques Hiblot wrote:
> 
> 
> On 11/10/2017 20:07, Denys Dmytriyenko wrote:
> >No need, I'll merge them as is.
> Thanks.
> BTW when doing a backport from another branch, should the original
> commit ID and branch be described?

Usually you keep original commit log including all SoBs, after which you 
provide info where it's forward/back-ported from, including original commit 
IDs and then new set of SoBs. For example:

===================================
recipe: change something

This change is due to this and that

Signed-off-by: Author
Signed-off-by: Maintainer

(from layer/branch commit-id)

Signed-off-by: Submitter
===================================

The part above (from layer/branch commit-id) is from the original commit.

This is the practice we use in the Yocto Project and besides helping with 
traceability, speeds up reviewing of backported patches, since they've been 
previously reviewed and accepted.

-- 
Denys


> >On Wed, Oct 11, 2017 at 08:05:06PM +0200, Jean-Jacques Hiblot wrote:
> >>On 11/10/2017 20:02, Denys Dmytriyenko wrote:
> >>>Are these 2 backports from morty? Please keep original commit logs then.
> >>Yes they are backports from morty?
> >>
> >>Do you want me to resend?
> >>
> >>JJ
> >>
> >>>
> >>>On Wed, Oct 11, 2017 at 07:58:44PM +0200, Jean-Jacques Hiblot wrote:
> >>>>Signed-off-by: Jean-Jacques Hiblot <jjhiblot@ti.com>
> >>>>---
> >>>>  meta-arago-distro/recipes-extended/socketcan/can-utils_git.bbappend | 3 +++
> >>>>  1 file changed, 3 insertions(+)
> >>>>  create mode 100644 meta-arago-distro/recipes-extended/socketcan/can-utils_git.bbappend
> >>>>
> >>>>diff --git a/meta-arago-distro/recipes-extended/socketcan/can-utils_git.bbappend b/meta-arago-distro/recipes-extended/socketcan/can-utils_git.bbappend
> >>>>new file mode 100644
> >>>>index 0000000..c0e6666
> >>>>--- /dev/null
> >>>>+++ b/meta-arago-distro/recipes-extended/socketcan/can-utils_git.bbappend
> >>>>@@ -0,0 +1,3 @@
> >>>>+SRCREV = "5b518a0a5fa56856f804372a6b99b518dedb5386"
> >>>>+
> >>>>+PR_append = ".arago0"
> >>>>-- 
> >>>>1.9.1
> >>>>
> 

