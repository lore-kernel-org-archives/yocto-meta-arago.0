Return-Path: <denys@ti.com>
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by arago-project.org (Postfix) with ESMTPS id 2CF6F529C0
	for <meta-arago@arago-project.org>;
	Thu, 12 Dec 2019 22:13:51 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id xBCMCGpn033744
	for <meta-arago@arago-project.org>; Thu, 12 Dec 2019 16:12:16 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1576188736;
	bh=gHDx8wceIp8xOc1598j6K6Oq24YycoNzDzm+a2DEDKQ=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=igXF1W+6SslVUoUpvplsjVPxauIhVRiIJfW4te+JZCkfeE80orQwzmf82+7j92pjB
	bSj/tzWDvkI6vVvv28EGTjocBshk6pj3UJz9DnpLTLyIR/kChKflNJ0kDLOGV7yAIy
	dYMv+eLAGDO+Eyjg6laSJ2kCFGmAHWvuOdbOom2I=
Received: from DLEE107.ent.ti.com (dlee107.ent.ti.com [157.170.170.37])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xBCMCGOE063471
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Thu, 12 Dec 2019 16:12:16 -0600
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE107.ent.ti.com
	(157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3;
	Thu, 12 Dec 2019 16:12:15 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE109.ent.ti.com
	(157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
	Frontend Transport; Thu, 12 Dec 2019 16:12:15 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id xBCMCFl8044010;
	Thu, 12 Dec 2019 16:12:15 -0600
Date: Thu, 12 Dec 2019 17:12:15 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: "Zhao (Compiler), Yuan" <yuanzhao@ti.com>
Message-ID: <20191212221215.GI32050@beryl>
References: <1576184573-9278-1-git-send-email-j-stiffler@ti.com>
	<20191212212957.GH32050@beryl>
	<57d9265856a64f69ab7db030230ebfd3@ti.com>
MIME-Version: 1.0
In-Reply-To: <57d9265856a64f69ab7db030230ebfd3@ti.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [EXTERNAL] Re: [master/thud/ti2019.05][PATCH] tidl-api: fix package-qa issues
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
X-List-Received-Date: Thu, 12 Dec 2019 22:13:51 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Yes, it is doable that way too, there are some examples in recipes, e.g.:
https://git.openembedded.org/meta-openembedded/tree/meta-oe/recipes-support/libtinyxml/libtinyxml_2.6.2.bb

-- 
Denys


On Thu, Dec 12, 2019 at 04:34:01PM -0500, Zhao (Compiler), Yuan wrote:
> Good question.  I overlooked this library versioning issue in the recipe 
> when installing the .so file to /usr/lib.
> 
> Is there a quick way to use $PV for versioning?  E.g. currently PV is 1.4.0, 
> so we should create libtidl_api.so.1.4.0, then libtidl_api.so.1, then 
> libtidl_api.so.
> 
> Thanks!
> 
> - Yuan
> 
> -----Original Message-----
> From: meta-arago-bounces@arago-project.org [mailto:meta-arago-bounces@arago-project.org] On Behalf Of Dmytriyenko, Denys
> Sent: Thursday, December 12, 2019 3:30 PM
> To: Stiffler, Jacob
> Cc: meta-arago@arago-project.org
> Subject: [EXTERNAL] Re: [meta-arago] [master/thud/ti2019.05][PATCH] tidl-api: fix package-qa issues
> 
> On Thu, Dec 12, 2019 at 04:02:53PM -0500, Jacob Stiffler wrote:
> > tidl-api does not create versioned libraries,
> 
> Should it be fixed then? What's the plan to address it?
> 
> 
> 
> > so provide these in the
> > base package and skip the QA checks.
> > 
> > Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
> > ---
> >  meta-arago-extras/recipes-ti/tidl-api/tidl-api_git.bb | 6 +++++-
> >  1 file changed, 5 insertions(+), 1 deletion(-)
> > 
> > diff --git a/meta-arago-extras/recipes-ti/tidl-api/tidl-api_git.bb b/meta-arago-extras/recipes-ti/tidl-api/tidl-api_git.bb
> > index a8829c1..ea12fb0 100644
> > --- a/meta-arago-extras/recipes-ti/tidl-api/tidl-api_git.bb
> > +++ b/meta-arago-extras/recipes-ti/tidl-api/tidl-api_git.bb
> > @@ -52,5 +52,9 @@ FILES_${PN} += "\
> >      ${TIDL_INSTALL_DIR} \
> >  "
> >  
> > +# Versioned libs are not created. See do_install().
> > +SOLIBS = ".so*"
> > +FILES_SOLIBSDEV = ""
> >  
> > -INSANE_SKIP_${PN} = "arch ldflags textrel staticdev"
> > +INSANE_SKIP_${PN} = "arch ldflags textrel staticdev libdir"
> > +INSANE_SKIP_${PN}-dbg = "libdir"
> > -- 
> > 2.7.4
> > 
> > _______________________________________________
> > meta-arago mailing list
> > meta-arago@arago-project.org
> > http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

