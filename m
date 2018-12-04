Return-Path: <denys@ti.com>
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by arago-project.org (Postfix) with ESMTPS id 4C24E52A25
	for <meta-arago@arago-project.org>;
	Tue,  4 Dec 2018 21:06:33 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id wB4L6MSZ029081
	for <meta-arago@arago-project.org>; Tue, 4 Dec 2018 15:06:22 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1543957582;
	bh=IU/hhlbHh/ilYDs57iyL+a4Muy/JTzTuuQ4z4ZJjqYA=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=jZn3osNg+4DtuEx8cEcLDAn9kJaDt7ulJr7FrAiIxPolGPwQrC8z4ulRJXrddQhYx
	wShyUvltRc9gjKvGgR8VNcRW8qo6O+Y67DljClUQ3r5EGYK1g7WyATGeUJWW1WjUqW
	0EZoAVSmwU/oyuRpQWHsjQWFFvszpOevrBjwo6es=
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id wB4L6M4q081205
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Tue, 4 Dec 2018 15:06:22 -0600
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE104.ent.ti.com
	(10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1591.10;
	Tue, 4 Dec 2018 15:06:21 -0600
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE107.ent.ti.com
	(10.64.6.28) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1591.10 via Frontend
	Transport; Tue, 4 Dec 2018 15:06:22 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id wB4L6MJI020113;
	Tue, 4 Dec 2018 15:06:22 -0600
Date: Tue, 4 Dec 2018 16:06:21 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: "Zhao, Yuan" <yuanzhao@ti.com>
Message-ID: <20181204210621.GV6887@beryl>
References: <20181204204833.27940-1-yuanzhao@ti.com>
	<20181204210410.GS6887@beryl>
	<788e3928354f4642900db3d9c7a2f8a0@ti.com>
MIME-Version: 1.0
In-Reply-To: <788e3928354f4642900db3d9c7a2f8a0@ti.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [PATCH v2] tidl-api: update to version 1.2.0
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
X-List-Received-Date: Tue, 04 Dec 2018 21:06:33 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Thanks!

On Tue, Dec 04, 2018 at 04:06:00PM -0500, Zhao, Yuan wrote:
> License is the same.  We added a top level text license file which points to 
> components in html file.  The checksum is now based on the top level license 
> file.  - Yuan
> 
> -----Original Message-----
> From: Dmytriyenko, Denys 
> Sent: Tuesday, December 4, 2018 3:04 PM
> To: Zhao, Yuan
> Cc: meta-arago@arago-project.org
> Subject: Re: [meta-arago] [PATCH v2] tidl-api: update to version 1.2.0
> 
> On Tue, Dec 04, 2018 at 02:48:33PM -0600, Yuan Zhao wrote:
> > - Minimized TIDL API/OpenCL dispatch overhead using multiple execution
> >   contexts on devices.  Added MNIST example for demonstration.
> > - Execution graph generation with timestamps.
> > - Python 3 bindings for TIDL API.
> > - Add a top level license file.
> 
> Is the license the same, just moved to a separate file?
> 
> 
> > Signed-off-by: Yuan Zhao <yuanzhao@ti.com>
> > ---
> >  meta-arago-extras/recipes-ti/tidl-api/tidl-api.inc         | 6 +++---
> >  meta-arago-extras/recipes-ti/tidl-api/tidl-api_git.bb      | 2 ++
> >  meta-arago-extras/recipes-ti/tidl-api/tidl-examples_git.bb | 2 ++
> >  3 files changed, 7 insertions(+), 3 deletions(-)
> > 
> > diff --git a/meta-arago-extras/recipes-ti/tidl-api/tidl-api.inc b/meta-arago-extras/recipes-ti/tidl-api/tidl-api.inc
> > index fb37a249..1b1167ec 100644
> > --- a/meta-arago-extras/recipes-ti/tidl-api/tidl-api.inc
> > +++ b/meta-arago-extras/recipes-ti/tidl-api/tidl-api.inc
> > @@ -1,11 +1,11 @@
> > -PV = "1.1.0.1"
> > +PV = "1.2.0"
> 
> I see you changed it back to not have leading zeros. I'm fine either way.
> 
> 
> >  INC_PR = "r0"
> >  
> > -LIC_FILES_CHKSUM = "file://tidl_api_manifest.html;md5=fb8d8b8edb866b0b233462139d1c3222"
> > +LIC_FILES_CHKSUM = "file://license.txt;md5=e3daeabffb9fc131a73f16d16cbdb118"
> >  
> >  GIT_URI = "git://git.ti.com/tidl/tidl-api.git"
> >  GIT_PROTOCOL = "git"
> >  BRANCH = "master"
> >  
> >  SRC_URI = "${GIT_URI};protocol=${GIT_PROTOCOL};branch=${BRANCH}"
> > -SRCREV = "7e9a3942ec38efd64d45e34c10cba2f2938f5618"
> > +SRCREV = "03978a83b03d8881261222344d1a08e0f4e2bd06"
> > diff --git a/meta-arago-extras/recipes-ti/tidl-api/tidl-api_git.bb b/meta-arago-extras/recipes-ti/tidl-api/tidl-api_git.bb
> > index 47e98ef9..fbea9aa8 100644
> > --- a/meta-arago-extras/recipes-ti/tidl-api/tidl-api_git.bb
> > +++ b/meta-arago-extras/recipes-ti/tidl-api/tidl-api_git.bb
> > @@ -11,6 +11,8 @@ PR = "${INC_PR}.0"
> >  COMPATIBLE_MACHINE = "am57xx-evm|am57xx-hs-evm"
> >  PACKAGE_ARCH = "${MACHINE_ARCH}"
> >  
> > +inherit python3native
> > +
> >  DEPENDS = "opencv \
> >             opencl \
> >             opencl-monitor \
> > diff --git a/meta-arago-extras/recipes-ti/tidl-api/tidl-examples_git.bb b/meta-arago-extras/recipes-ti/tidl-api/tidl-examples_git.bb
> > index 94f215c3..2f5ca537 100644
> > --- a/meta-arago-extras/recipes-ti/tidl-api/tidl-examples_git.bb
> > +++ b/meta-arago-extras/recipes-ti/tidl-api/tidl-examples_git.bb
> > @@ -15,11 +15,13 @@ DEPENDS = "opencv \
> >             clocl-native \
> >             ti-cgt6x-native \
> >             tidl-api \
> > +           json-c \
> >  "
> >  
> >  RDEPENDS_${PN} += "tidl-api \
> >                     opencl-runtime \
> >                     opencv \
> > +                   json-c \
> >  "
> >  
> >  S = "${WORKDIR}/git"
> > -- 
> > 2.14.1
> > 
> > _______________________________________________
> > meta-arago mailing list
> > meta-arago@arago-project.org
> > http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

