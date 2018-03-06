Return-Path: <denys@ti.com>
Received: from lelnx193.ext.ti.com (lelnx193.ext.ti.com [198.47.27.77])
	by arago-project.org (Postfix) with ESMTPS id 9B40C52975
	for <meta-arago@arago-project.org>;
	Tue,  6 Mar 2018 16:22:30 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelnx193.ext.ti.com (8.15.1/8.15.1) with ESMTP id w26GLlil003579
	for <meta-arago@arago-project.org>; Tue, 6 Mar 2018 10:21:47 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1520353307;
	bh=8DmfJdrfuxUgluWSzjqT42lVm2/MS6PXNhJljo8OxxM=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=Qt8yW6Iqe/8oast4aqfqSNWt+YzjLku6uTWANHBkOPaCYg/ArNfT92hreDIzI3svr
	707EET+JrsH8MdLAd00q99f4z0ecPqf6NhfLEDSCFJno2AGXqQsTYUORFJyZIel21M
	ivW8j5rPm2Y6Oz+iqaQ0E3aCoWKPOoyJpp0z/PGo=
Received: from DLEE110.ent.ti.com (dlee110.ent.ti.com [157.170.170.21])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w26GLlxn016744
	for <meta-arago@arago-project.org>; Tue, 6 Mar 2018 10:21:47 -0600
Received: from DLEE106.ent.ti.com (157.170.170.36) by DLEE110.ent.ti.com
	(157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1261.35;
	Tue, 6 Mar 2018 10:21:46 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE106.ent.ti.com
	(157.170.170.36) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1261.35 via Frontend
	Transport; Tue, 6 Mar 2018 10:21:46 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id w26GLkZu001873;
	Tue, 6 Mar 2018 10:21:46 -0600
Date: Tue, 6 Mar 2018 11:21:46 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: Jacob Stiffler <j-stiffler@ti.com>
Message-ID: <20180306162145.GM29482@edge>
References: <1519932329-26946-1-git-send-email-j-stiffler@ti.com>
	<356933e6-5334-3661-bb5f-2f892fcb13a7@ti.com>
MIME-Version: 1.0
In-Reply-To: <356933e6-5334-3661-bb5f-2f892fcb13a7@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-arago@arago-project.org
Subject: Re: [morty/rocko/master][PATCH v2 1/2] ti-llvm3.6: add dependency on groff-native
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
X-List-Received-Date: Tue, 06 Mar 2018 16:22:35 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

That's what I was just asking Eric last night...

On Tue, Mar 06, 2018 at 08:28:29AM -0500, Jacob Stiffler wrote:
> I see that this was accepted into rocko/master, but can this also be
> accepted into morty?
> 
> 
> On 3/1/2018 2:25 PM, Jacob Stiffler wrote:
> >* groff is used to generate documentaion during the install task
> >
> >Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
> >---
> >* No change for this patch, but an additional patch is added to the set.
> >
> >  meta-arago-extras/recipes-core/llvm/ti-llvm3.6_3.6.bb | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> >diff --git a/meta-arago-extras/recipes-core/llvm/ti-llvm3.6_3.6.bb b/meta-arago-extras/recipes-core/llvm/ti-llvm3.6_3.6.bb
> >index 4f36310..91d3cea 100644
> >--- a/meta-arago-extras/recipes-core/llvm/ti-llvm3.6_3.6.bb
> >+++ b/meta-arago-extras/recipes-core/llvm/ti-llvm3.6_3.6.bb
> >@@ -17,7 +17,7 @@ require recipes-core/llvm/llvm.inc
> >  LIC_FILES_CHKSUM = "file://LICENSE.TXT;md5=47e311aa9caedd1b3abf098bd7814d1d"
> >-DEPENDS += "libxml2"
> >+DEPENDS += "libxml2 groff-native"
> >  DEPENDS_append_class-target = " valgrind"
> >  LLVM_DIR = "ti-llvm${PV}"
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

