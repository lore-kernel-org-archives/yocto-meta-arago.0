Return-Path: <denis@denix.org>
Received: from vms173023pub.verizon.net (vms173023pub.verizon.net
	[206.46.173.23])
	by arago-project.org (Postfix) with ESMTPS id 0349F5299C
	for <meta-arago@arago-project.org>;
	Fri,  9 Oct 2015 13:19:37 +0000 (UTC)
Received: from gandalf.denix.org ([108.51.169.48]) by vms173023.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul
	16 2014))
	with ESMTPSA id <0NVY00K1HFOBV1J0@vms173023.mailsrvcs.net> for
	meta-arago@arago-project.org; Fri, 09 Oct 2015 08:19:24 -0500 (CDT)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=WcjxEBVX c=1 sm=1 tr=0	a=x3PDphkivVtATbYodTxRAw==:117
	a=0gcC27t9AAAA:8 a=oR5dmqMzAAAA:8	a=eIhxMilvRf8A:10 a=kj9zAlcOel0A:10
	a=5lJygRwiOn0A:10 a=sozttTNsAAAA:8	a=Q4-j1AaZAAAA:8 a=HihYlcsHAAAA:8
	a=NEAV23lmAAAA:8 a=KKAkSRfTAAAA:8	a=5OnXbwFl-ampRJLa55AA:9
	a=CjuIK1q_8ugA:10
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 815BD161C70; Fri,
	9 Oct 2015 09:19:23 -0400 (EDT)
Date: Fri, 09 Oct 2015 09:19:23 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Jacob Stiffler <j-stiffler@ti.com>
Message-id: <20151009131923.GI11709@denix.org>
References: <1444391940-2958-1-git-send-email-j-stiffler@ti.com>
	<1444391940-2958-2-git-send-email-j-stiffler@ti.com>
	<20151009131101.GH11709@denix.org> <5617BE03.9040609@ti.com>
MIME-version: 1.0
In-reply-to: <5617BE03.9040609@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org
Subject: Re: [oe-layersetup][PATCH v2 2/2] configs: Add processor-sdk-02.00.00.00-config
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
X-List-Received-Date: Fri, 09 Oct 2015 13:19:37 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Fri, Oct 09, 2015 at 09:15:47AM -0400, Jacob Stiffler wrote:
> 
> 
> On 10/9/2015 9:11 AM, Denys Dmytriyenko wrote:
> >On Fri, Oct 09, 2015 at 07:59:00AM -0400, Jacob Stiffler wrote:
> >>Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
> >>---
> >>v2 changes:
> >>   * Add "oe-layersetup" prefix
> >>   * Find copies harder
> >Is this a release config? Why are you switching off the release tag?
> 
> Yes, this is a release config. Are not the commit IDs preferred to
> tags since they cannot move?

Hmm, I didn't realize those commits point to the tags they are replacing. I 
was using tags previously in these configs, but I see your point. Either way 
should be fine.


> >>  .../processor-sdk-02.00.00.00-config.txt}                          | 7 ++++---
> >>  1 file changed, 4 insertions(+), 3 deletions(-)
> >>  copy configs/{coresdk/coresdk-2015.01-config.txt => processor-sdk/processor-sdk-02.00.00.00-config.txt} (64%)
> >>
> >>diff --git a/configs/coresdk/coresdk-2015.01-config.txt b/configs/processor-sdk/processor-sdk-02.00.00.00-config.txt
> >>similarity index 64%
> >>copy from configs/coresdk/coresdk-2015.01-config.txt
> >>copy to configs/processor-sdk/processor-sdk-02.00.00.00-config.txt
> >>index 6c544d6..f43a511 100644
> >>--- a/configs/coresdk/coresdk-2015.01-config.txt
> >>+++ b/configs/processor-sdk/processor-sdk-02.00.00.00-config.txt
> >>@@ -2,11 +2,12 @@
> >>  # repo name,repo uri,repo branch,repo commit[,layers=layer1:layer2...:layern]
> >>  bitbake,git://git.openembedded.org/bitbake,1.26,ed30f4ee1cef8db9ea422c5e54b2375c4f3b1d6f,layers=
> >>-meta-arago,git://arago-project.org/git/meta-arago.git,master,ti2015.01,layers=meta-arago-distro:meta-arago-extras
> >>+meta-processor-sdk,git://arago-project.org/git/projects/meta-processor-sdk.git,master,bfc49c171cead0cf0b5d859f51c45364a74e1ea7,layers=
> >>+meta-arago,git://arago-project.org/git/meta-arago.git,master,f36422977840d88696e4ea209a82b0caa37a3f5d,layers=meta-arago-distro:meta-arago-extras
> >>  meta-qt5,git://github.com/meta-qt5/meta-qt5.git,master,97ce05c0b2a81f05388d7f727741529fb9177775,layers=
> >>  meta-openembedded,git://git.openembedded.org/meta-openembedded,fido,214e1801d0efc38d3b6142bdc0d8e58ca593e34c,layers=meta-networking:meta-ruby:meta-python:meta-oe
> >>-meta-ti,git://arago-project.org/git/meta-ti.git,fido,ti2015.01,layers=
> >>+meta-ti,git://arago-project.org/git/meta-ti.git,fido,0a222c70845d19a2213ac36803361e8531768cca,layers=
> >>  meta-linaro,git://git.linaro.org/openembedded/meta-linaro.git,fido,3f1933242062d1cf473d20b86fa4582963ff9441,layers=meta-linaro-toolchain
> >>  oe-core,git://git.openembedded.org/openembedded-core,fido,4c02a30f084408d0a6a5149937ef74520f8346dc,layers=meta
> >>  OECORELAYERCONF=./sample-files/bblayers.conf.sample
> >>-OECORELOCALCONF=./sample-files/local-arago64.conf.sample
> >>+OECORELOCALCONF=./sample-files/local-processor-sdk-64.conf.sample
> >>-- 
> >>1.9.1
> >>
> >>_______________________________________________
> >>meta-arago mailing list
> >>meta-arago@arago-project.org
> >>http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
> >>
> 

