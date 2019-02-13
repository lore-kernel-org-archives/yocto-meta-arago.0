Return-Path: <denys@ti.com>
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by arago-project.org (Postfix) with ESMTPS id A7A48529B0
	for <meta-arago@arago-project.org>;
	Wed, 13 Feb 2019 01:57:47 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x1D1vXWk075731
	for <meta-arago@arago-project.org>; Tue, 12 Feb 2019 19:57:33 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1550023053;
	bh=CGQd98kgLTvcl5jX5hqsJEQNSWhosOrfUZDOKDqMo98=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=xu+TD+QvcxwRZiZQ+/vBQzLWRuOev3b8dGJQ7p9tbAi9pHWza9yhQVc+o4S4FB0Q9
	CHmRb41R7PLy1RFAp1h6KE8hHtM8cX2K7ec4xDDvSQCV/p/CkUCsv1QqLFndh5I+X4
	VdPuscS96toiVfCoDaKNk8YNOsoyOqzzzB8OYWr4=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x1D1vXec019886
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Tue, 12 Feb 2019 19:57:33 -0600
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE108.ent.ti.com
	(10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1591.10;
	Tue, 12 Feb 2019 19:57:32 -0600
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE114.ent.ti.com
	(10.64.6.35) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1591.10 via Frontend
	Transport; Tue, 12 Feb 2019 19:57:32 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id x1D1vW0G018688;
	Tue, 12 Feb 2019 19:57:32 -0600
Date: Tue, 12 Feb 2019 20:57:32 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: "Agrawal, Manisha" <manisha.agrawal@ti.com>
Message-ID: <20190213015732.GB4386@beryl>
References: <20190204174300.13373-1-manisha.agrawal@ti.com>
	<20190213014839.GA4386@beryl>
	<82f44a5d2e2b4a1c8bfe4d3c44b86909@ti.com>
MIME-Version: 1.0
In-Reply-To: <82f44a5d2e2b4a1c8bfe4d3c44b86909@ti.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [rocko/master][PATCH v1] matrix-gui-apps: bump SRCREV to get the mmwavegesture-hmi changes
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
X-List-Received-Date: Wed, 13 Feb 2019 01:57:48 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Tue, Feb 12, 2019 at 08:50:17PM -0500, Agrawal, Manisha wrote:
> I didn't understand the comment.

ERROR: ParseError at .../meta-arago/meta-arago-extras/recipes-core/matrix/matrix-gui-apps-git.inc:10: unparsed line: 'i'


> -----Original Message-----
> From: Dmytriyenko, Denys 
> Sent: Tuesday, February 12, 2019 7:49 PM
> To: Agrawal, Manisha
> Cc: meta-arago@arago-project.org; Stiffler, Jacob; Gou, Hongmei
> Subject: Re: [meta-arago][rocko/master][PATCH v1] matrix-gui-apps: bump SRCREV to get the mmwavegesture-hmi changes
> 
> On Mon, Feb 04, 2019 at 11:43:00AM -0600, Manisha Agrawal wrote:
> > Signed-off-by: Manisha Agrawal <manisha.agrawal@ti.com>
> > ---
> >  meta-arago-extras/recipes-core/matrix/matrix-gui-apps-git.inc | 6 +++---
> >  1 file changed, 3 insertions(+), 3 deletions(-)
> > 
> > diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui-apps-git.inc b/meta-arago-extras/recipes-core/matrix/matrix-gui-apps-git.inc
> > index d74f889..1781134 100644
> > --- a/meta-arago-extras/recipes-core/matrix/matrix-gui-apps-git.inc
> > +++ b/meta-arago-extras/recipes-core/matrix/matrix-gui-apps-git.inc
> > @@ -4,9 +4,9 @@ LICENSE_CHECKSUM = "LICENSE;md5=6e0ae7214f6c74c149cb25f373057fa9"
> >  LIC_FILES_CHKSUM := "file://../${LICENSE_CHECKSUM}"
> >  
> >  SRC_URI = "git://git.ti.com/matrix-gui-v2/matrix-gui-v2-apps.git;protocol=git;branch=${BRANCH}"
> > -SRCREV = "20f1f86c7b8ec9e1ccc52953fb2a9bac74e23efd"
> > +SRCREV = "94e9f17332065fa838d9334efdab8451c8119b8d"
> >  BRANCH = "master"
> > -INC_PR = "r64"
> > -
> > +INC_PR = "r65"
> > +i
> 
> ^^^^ ???
> 
> 
> >  # Pull in the base package for installing matrix applications
> >  require matrix-gui-apps.inc
> > -- 
> > 2.13.0
> > 

