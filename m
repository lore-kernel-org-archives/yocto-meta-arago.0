Return-Path: <nikhil.nd@ti.com>
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by arago-project.org (Postfix) with ESMTPS id 4C4D452999
	for <meta-arago@arago-project.org>;
	Tue, 27 Oct 2020 21:08:14 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 09RL57rn104642
	for <meta-arago@arago-project.org>; Tue, 27 Oct 2020 16:05:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1603832707;
	bh=Q/pE7iicBzidCtVphT3fnqCJqhZ6WBrfuE0kORuBTOY=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=aXIjxPyobgjMC4W8mtK5HqEndd3aZ3Gmzj7m2LT3NY5KuoERk6MCDSDHzUPfka1eb
	jM0b1NWZ4uL0ehn/QOU804Xwv38/9TvbfpSE4HJZRihy7saF9517LuEmvOSgjNkXQD
	+CcOKfkMdysB9iPu7iLUnnMfXOFZZlSX9PDEb35A=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 09RL57HI058820
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Tue, 27 Oct 2020 16:05:07 -0500
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE112.ent.ti.com
	(157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3;
	Tue, 27 Oct 2020 16:05:07 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE112.ent.ti.com
	(157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
	Frontend Transport; Tue, 27 Oct 2020 16:05:07 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 09RL56ha021211;
	Tue, 27 Oct 2020 16:05:07 -0500
Date: Wed, 28 Oct 2020 02:35:05 +0530
From: Nikhil Devshatwar <nikhil.nd@ti.com>
To: Dan Murphy <dmurphy@ti.com>, Denys Dmytriyenko <denys@ti.com>
Message-ID: <20201027210505.ukjakzvqoekot24b@NiksLab>
References: <20201026155125.31513-1-nikhil.nd@ti.com>
	<1cfdbbf2-80e3-29b6-02f0-c6ef9b332168@ti.com>
	<20201027101128.p2ub37j5ycztmzm6@NiksLab>
	<5c43aa61-ee89-ac25-d7f5-42ad3f3a8668@ti.com>
	<20201027185207.GV19741@beryl>
	<1536bc19-4519-eb0a-0db1-0d9f3db9074b@ti.com>
	<20201027190644.GX19741@beryl>
	<de249181-8540-c056-6834-2a66a47944d4@ti.com>
	<20201027192620.uv3p3eswf7ndqz2g@NiksLab>
MIME-Version: 1.0
In-Reply-To: <20201027192620.uv3p3eswf7ndqz2g@NiksLab>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-arago@arago-project.org, aparnab@ti.com
Subject: Re: [dunfell PATCH 1/2] websocketd: Add new recipe
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
X-List-Received-Date: Tue, 27 Oct 2020 21:08:14 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On 00:56-20201028, Nikhil Devshatwar wrote:
> On 14:11-20201027, Dan Murphy wrote:
> > Denys/Nikhil
> > 
> > On 10/27/20 2:06 PM, Denys Dmytriyenko wrote:
> > > On Tue, Oct 27, 2020 at 01:57:06PM -0500, Dan Murphy wrote:
> > > > Denys
> > > > 
> > > > On 10/27/20 1:52 PM, Denys Dmytriyenko wrote:
> > > > > On Tue, Oct 27, 2020 at 01:42:32PM -0500, Dan Murphy wrote:
> > > > > > Nikhil
> > > > > > 
> > > > > > On 10/27/20 5:11 AM, Nikhil Devshatwar wrote:
> > > > > > > On 11:09-20201026, Dan Murphy wrote:
> > > > > > > > Nikhil
> > > > > > > > 
> > > > > > > > On 10/26/20 10:51 AM, Nikhil Devshatwar wrote:
> > > > > > > > > websocketd is an application which allows to redirect output of
> > > > > > > > > command line applications via a websocket so that web pages can
> > > > > > > > > interact with them.
> > > > > > > > > 
> > > > > > > > > This is very useful for visualizing statistics information on
> > > > > > > > > host machine browser.
> > > > > > > > > 
> > > > > > > > > Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
> > > > > > > > > ---
> > > > > > > > >    .../recipes-devtools/websocketd/websocketd.bb    | 16 ++++++++++++++++
> > > > > > > > >    1 file changed, 16 insertions(+)
> > > > > > > > >    create mode 100644 meta-arago-extras/recipes-devtools/websocketd/websocketd.bb
> > > > > > > > > 
> > > > > > > > > diff --git a/meta-arago-extras/recipes-devtools/websocketd/websocketd.bb b/meta-arago-extras/recipes-devtools/websocketd/websocketd.bb
> > > > > > > > > new file mode 100644
> > > > > > > > > index 00000000..44f549ee
> > > > > > > > > --- /dev/null
> > > > > > > > > +++ b/meta-arago-extras/recipes-devtools/websocketd/websocketd.bb
> > > > > > > > > @@ -0,0 +1,16 @@
> > > > > > > > > +SUMMARY = "Application for routing native applications via websockets"
> > > > > > > > > +HOMEPAGE = "http://websocketd.com/"
> > > > > > > > > +
> > > > > > > > > +LICENSE = "BSD-2-Clause"
> > > > > > > > > +LIC_FILES_CHKSUM = "file://LICENSE;md5=a14d7befdbee1290ac5c472cd85d66f2"
> > > > > > > > > +
> > > > > > > > > +PV = "0.3.0"
> > > > > > > > 0.3.1 is available
> > > > > > > > > +SRC_URI = "https://github.com/joewalnes/websocketd/releases/download/v${PV}/websocketd-${PV}-linux_arm64.zip"
> > > > > > > > Is this valid for ARM32? Does this build for am3 or am4?
> > > > > > > > 
> > > > > > > > I see websocketd-0.3.1-linux_arm.zip available for 32 bit
> > > > > > > This is planned to be supported only for K3 platforms.
> > > > > > > I haven't run it on any arm32 platforms.
> > > > > > > Should I add a compatible machine here and in the statcol recipe as well?
> > > > > > If you only intend to use the 64 bit package then yes you probably should
> > > > > > restrict it to 64 bit platforms so it does not get pulled into the 32 bit
> > > > > > platform.
> > > > > Why cannot it be build from sources instead of pulling prebuilt binaries?
> > > > > 
> > > > It is coded in Go can the Yocto build Go yet?
> > > Absolutely! Usually all you need is to "inherit go" bbclass. There are some
> > > existing examples out there:
> > > 
> > > https://git.openembedded.org/openembedded-core/tree/meta/recipes-extended/go-examples/go-helloworld_0.1.bb
> > > https://git.openembedded.org/openembedded-core/tree/meta/recipes-devtools/glide/glide_0.13.3.bb
> > > 
> > Nice! Lets build it from source then instead of pulling a pre-compiled
> > release
> > 
> > This way we can just build for the arch as well. If that is not needed then
> > we should make it Arch dependent but lets try to build for both 32 and 64
> > bit
> > 
> 
> Okay, Let me give it a try and repost
> Nikhil D
> 

Hi Denys, Dan,

Well, I tried a simple recipe and I am not able to figure out how the
dependencies are handled in go package builds.

I tried to add DEPENDS, I tried to run "go get" command after
do_configure and before do_compile, but this didn't help.

I inherited go-mod instead of go  (Not sure if this is a right step)
In this, I get another error when go is trying to download the
dependency package. Looks like a DNS lookup error.

Recipe and logs here:
http://serenity.dal.design.ti.com:7777/raw/rekohinake

Please help me how to fix this. This is my first attempt to build any go
package. bitbake and otherwise also.

> > Dan
> > 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

