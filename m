Return-Path: <denys@ti.com>
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by arago-project.org (Postfix) with ESMTPS id 62A0052986
	for <meta-arago@arago-project.org>;
	Wed, 28 Oct 2020 23:31:37 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 09SNSUjs104485
	for <meta-arago@arago-project.org>; Wed, 28 Oct 2020 18:28:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1603927710;
	bh=EamwYR+GnymgJZn9ZYjS6QePeT6vztGw2yd0mie5e1Q=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=M8/NMsQ+XWhJF/QO2O/bS/EDpUCmmx1X5ZmqN5TDnHy2/arTgJeX9vPFFnoRXn4+P
	crj9Im/9AfFquY6liNe6+P6yqTQTl/0c0Wy3IhIf+fNXlnkVx1bwlSXAWM1SDPekh5
	DHBvmCymemfwbn57BT1Nq8GrR/SChYGPG+giwPVw=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 09SNSUHW002682
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Wed, 28 Oct 2020 18:28:30 -0500
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE108.ent.ti.com
	(157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3;
	Wed, 28 Oct 2020 18:28:30 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE114.ent.ti.com
	(157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
	Frontend Transport; Wed, 28 Oct 2020 18:28:30 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 09SNSUVv038292;
	Wed, 28 Oct 2020 18:28:30 -0500
Date: Wed, 28 Oct 2020 19:28:30 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Nikhil Devshatwar <nikhil.nd@ti.com>
Message-ID: <20201028232829.GE19741@beryl>
References: <5c43aa61-ee89-ac25-d7f5-42ad3f3a8668@ti.com>
	<20201027185207.GV19741@beryl>
	<1536bc19-4519-eb0a-0db1-0d9f3db9074b@ti.com>
	<20201027190644.GX19741@beryl>
	<de249181-8540-c056-6834-2a66a47944d4@ti.com>
	<20201027192620.uv3p3eswf7ndqz2g@NiksLab>
	<20201027210505.ukjakzvqoekot24b@NiksLab>
	<20201028072703.vmp6x47tbjlnqhhe@NiksLab>
	<20201028170725.q2osjq6qgnk6fvxa@NiksLab>
	<20201028214355.GC19741@beryl>
MIME-Version: 1.0
In-Reply-To: <20201028214355.GC19741@beryl>
User-Agent: Mutt/1.5.24 (2015-08-30)
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
X-List-Received-Date: Wed, 28 Oct 2020 23:31:37 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Wed, Oct 28, 2020 at 05:43:56PM -0400, Denys Dmytriyenko wrote:
> On Wed, Oct 28, 2020 at 10:37:25PM +0530, Nikhil Devshatwar wrote:
> > On 12:57-20201028, Nikhil Devshatwar wrote:
> > > On 02:35-20201028, Nikhil Devshatwar wrote:
> > > > On 00:56-20201028, Nikhil Devshatwar wrote:
> > > > > On 14:11-20201027, Dan Murphy wrote:
> > > > > > Denys/Nikhil
> > > > > > 
> > > > > > On 10/27/20 2:06 PM, Denys Dmytriyenko wrote:
> > > > > > > On Tue, Oct 27, 2020 at 01:57:06PM -0500, Dan Murphy wrote:
> > > > > > > > Denys
> > > > > > > > 
> > > > > > > > On 10/27/20 1:52 PM, Denys Dmytriyenko wrote:
> > > > > > > > > On Tue, Oct 27, 2020 at 01:42:32PM -0500, Dan Murphy wrote:
> > > > > > > > > > Nikhil
> > > > > > > > > > 
> > > > > > > > > > On 10/27/20 5:11 AM, Nikhil Devshatwar wrote:
> > > > > > > > > > > On 11:09-20201026, Dan Murphy wrote:
> > > > > > > > > > > > Nikhil
> > > > > > > > > > > > 
> > > > > > > > > > > > On 10/26/20 10:51 AM, Nikhil Devshatwar wrote:
> > > > > > > > > > > > > websocketd is an application which allows to redirect output of
> > > > > > > > > > > > > command line applications via a websocket so that web pages can
> > > > > > > > > > > > > interact with them.
> > > > > > > > > > > > > 
> > > > > > > > > > > > > This is very useful for visualizing statistics information on
> > > > > > > > > > > > > host machine browser.
> > > > > > > > > > > > > 
> > > > > > > > > > > > > Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
> > > > > > > > > > > > > ---
> > > > > > > > > > > > >    .../recipes-devtools/websocketd/websocketd.bb    | 16 ++++++++++++++++
> > > > > > > > > > > > >    1 file changed, 16 insertions(+)
> > > > > > > > > > > > >    create mode 100644 meta-arago-extras/recipes-devtools/websocketd/websocketd.bb
> > > > > > > > > > > > > 
> > > > > > > > > > > > > diff --git a/meta-arago-extras/recipes-devtools/websocketd/websocketd.bb b/meta-arago-extras/recipes-devtools/websocketd/websocketd.bb
> > > > > > > > > > > > > new file mode 100644
> > > > > > > > > > > > > index 00000000..44f549ee
> > > > > > > > > > > > > --- /dev/null
> > > > > > > > > > > > > +++ b/meta-arago-extras/recipes-devtools/websocketd/websocketd.bb
> > > > > > > > > > > > > @@ -0,0 +1,16 @@
> > > > > > > > > > > > > +SUMMARY = "Application for routing native applications via websockets"
> > > > > > > > > > > > > +HOMEPAGE = "http://websocketd.com/"
> > > > > > > > > > > > > +
> > > > > > > > > > > > > +LICENSE = "BSD-2-Clause"
> > > > > > > > > > > > > +LIC_FILES_CHKSUM = "file://LICENSE;md5=a14d7befdbee1290ac5c472cd85d66f2"
> > > > > > > > > > > > > +
> > > > > > > > > > > > > +PV = "0.3.0"
> > > > > > > > > > > > 0.3.1 is available
> > > > > > > > > > > > > +SRC_URI = "https://github.com/joewalnes/websocketd/releases/download/v${PV}/websocketd-${PV}-linux_arm64.zip"
> > > > > > > > > > > > Is this valid for ARM32? Does this build for am3 or am4?
> > > > > > > > > > > > 
> > > > > > > > > > > > I see websocketd-0.3.1-linux_arm.zip available for 32 bit
> > > > > > > > > > > This is planned to be supported only for K3 platforms.
> > > > > > > > > > > I haven't run it on any arm32 platforms.
> > > > > > > > > > > Should I add a compatible machine here and in the statcol recipe as well?
> > > > > > > > > > If you only intend to use the 64 bit package then yes you probably should
> > > > > > > > > > restrict it to 64 bit platforms so it does not get pulled into the 32 bit
> > > > > > > > > > platform.
> > > > > > > > > Why cannot it be build from sources instead of pulling prebuilt binaries?
> > > > > > > > > 
> > > > > > > > It is coded in Go can the Yocto build Go yet?
> > > > > > > Absolutely! Usually all you need is to "inherit go" bbclass. There are some
> > > > > > > existing examples out there:
> > > > > > > 
> > > > > > > https://git.openembedded.org/openembedded-core/tree/meta/recipes-extended/go-examples/go-helloworld_0.1.bb
> > > > > > > https://git.openembedded.org/openembedded-core/tree/meta/recipes-devtools/glide/glide_0.13.3.bb
> > > > > > > 
> > > > > > Nice! Lets build it from source then instead of pulling a pre-compiled
> > > > > > release
> > > > > > 
> > > > > > This way we can just build for the arch as well. If that is not needed then
> > > > > > we should make it Arch dependent but lets try to build for both 32 and 64
> > > > > > bit
> > > > > > 
> > > > > 
> > > > > Okay, Let me give it a try and repost
> > > > > Nikhil D
> > > > > 
> > > > 
> > > > Hi Denys, Dan,
> > > > 
> > > > Well, I tried a simple recipe and I am not able to figure out how the
> > > > dependencies are handled in go package builds.
> > > > 
> > > > I tried to add DEPENDS, I tried to run "go get" command after
> > > > do_configure and before do_compile, but this didn't help.
> > > > 
> > > > I inherited go-mod instead of go  (Not sure if this is a right step)
> > > > In this, I get another error when go is trying to download the
> > > > dependency package. Looks like a DNS lookup error.
> > > > 
> > > > Recipe and logs here:
> > > > http://serenity.dal.design.ti.com:7777/raw/rekohinake
> > > 
> > > Here is a publicly accessible link for the logs
> > > https://pastebin.ubuntu.com/p/Cr536RF25t/
> > > 
> > 
> > Hi Dan, Denys,
> > 
> > Can you please give me a hint on what might be going wrong?
> > It seems that the inherit go-mod is right thing to do but I am not
> > able to figure out how to fix the DNS lookup errors.
> 
> Yes, inherit go-mod is correct. I'm not seeing any DNS/proxy issues from 
> outside - looks like it's specific to TI network. Let me try over VPN, but 
> that would be setup issue and not specific to a recipe.

See v4 for the fix.


> -- 
> Denys
> 
> 
> > Regards,
> > Nikhil D
> > 
> > > Nikhil D
> > > 
> > > > 
> > > > Please help me how to fix this. This is my first attempt to build any go
> > > > package. bitbake and otherwise also.
> > > > 
> > > > > > Dan
> > > > > > 
> > > > > _______________________________________________
> > > > > meta-arago mailing list
> > > > > meta-arago@arago-project.org
> > > > > http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
> > > > _______________________________________________
> > > > meta-arago mailing list
> > > > meta-arago@arago-project.org
> > > > http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
> > > _______________________________________________
> > > meta-arago mailing list
> > > meta-arago@arago-project.org
> > > http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

