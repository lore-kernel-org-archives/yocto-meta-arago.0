Return-Path: <anders@chargestorm.se>
Received: from STOEXHUB01.domain01.net (STOEXHUB01.domain01.net
	[83.145.59.142])
	by arago-project.org (Postfix) with ESMTPS id 4583D5299C
	for <meta-arago@arago-project.org>;
	Wed,  9 Apr 2014 07:42:23 +0000 (UTC)
Received: from ad.chargestorm.se (2.69.69.114) by STOEXHUB01.domain01.net
	(10.12.10.1) with Microsoft SMTP Server (TLS) id 8.3.279.1;
	Wed, 9 Apr 2014 09:42:21 +0200
Date: Wed, 9 Apr 2014 09:42:19 +0200
From: Anders Darander <anders@chargestorm.se>
To: <meta-arago@arago-project.org>
Message-ID: <20140409074218.GA6220@ad.chargestorm.se>
Mail-Followup-To: meta-arago@arago-project.org
References: <20140310121416.GC4423@ad.chargestorm.se>
	<20140314161649.GD12929@edge>
	<20140321142643.GA1479@ad.chargestorm.se>
	<20140402075039.GA5988@ad.chargestorm.se>
	<20140407223700.GC12929@edge> <20140408010449.GE12929@edge>
MIME-Version: 1.0
In-Reply-To: <20140408010449.GE12929@edge>
X-Accept-Language: sv, en, de
X-GPG-Fingerprint: 5AF0 B2E9 78FE 9D75 D110  6F8F 3E31 84D7 920E 938C
X-GPG-Key-Id: 0x920E938C
X-GPG-Keyserver: hkp://keys.gnupg.net
Organization: ChargeStorm AB
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: Issue building gcc-cross-initial
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
X-List-Received-Date: Wed, 09 Apr 2014 07:42:23 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

* Denys Dmytriyenko <denys@ti.com> [140408 03:04]:

> On Mon, Apr 07, 2014 at 06:37:01PM -0400, Denys Dmytriyenko wrote:
> > Ok, it took me some time and effort (the error is severely misleading), but I 
> > was finally able to trace down what causes the breakage in the internal 
> > toolchain:

> > http://arago-project.org/git/?p=meta-arago.git;a=commitdiff;h=e9797a456c99c890e5ff62334b7d65e1ff7db676

Ah, nice catch!

Thanks for the hard work debugging this!

> > The addition of libc-headers version used for the platform into the 
> > PACKAGE_ARCH causes gcc-cross-initial to not find binutils binaries during 
> > bootstrap.

> > I'm still trying to figure out if it would be possible to unbreak the build, 
> > while keeping the change, but at least it should be possible to have a quick 

For the moment, I'm going with this solution as the customer in question
will only build for one SoC and uses a custom distro.

> And this seems to have resolved the issue:

> STAGING_BINDIR_TOOLCHAIN = "${STAGING_DIR_NATIVE}${bindir_native}/${TUNE_PKGARCH}-${PREFERRED_VERSION_linux-libc-headers}${TARGET_VENDOR}-${TARGET_OS}"

This should likely solve it in the more general case.

Cheers,
Anders

-- 
Anders Darander
ChargeStorm AB / eStorm AB

