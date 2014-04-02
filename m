Return-Path: <anders@chargestorm.se>
Received: from STOEXHUB02.domain01.net (STOEXHUB02.domain01.net
	[83.145.59.143])
	by arago-project.org (Postfix) with ESMTPS id D24BF52A67
	for <meta-arago@arago-project.org>;
	Wed,  2 Apr 2014 07:50:44 +0000 (UTC)
Received: from ad.chargestorm.se (95.209.90.98) by stoexhub02.domain01.net
	(10.12.10.2) with Microsoft SMTP Server (TLS) id 8.3.279.1;
	Wed, 2 Apr 2014 09:50:43 +0200
Date: Wed, 2 Apr 2014 09:50:41 +0200
From: Anders Darander <anders@chargestorm.se>
To: Denys Dmytriyenko <denys@ti.com>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Message-ID: <20140402075039.GA5988@ad.chargestorm.se>
Mail-Followup-To: Denys Dmytriyenko <denys@ti.com>,
	"meta-arago@arago-project.org" <meta-arago@arago-project.org>
References: <20140310121416.GC4423@ad.chargestorm.se>
	<20140314161649.GD12929@edge>
	<20140321142643.GA1479@ad.chargestorm.se>
MIME-Version: 1.0
In-Reply-To: <20140321142643.GA1479@ad.chargestorm.se>
X-Accept-Language: sv, en, de
X-GPG-Fingerprint: 5AF0 B2E9 78FE 9D75 D110  6F8F 3E31 84D7 920E 938C
X-GPG-Key-Id: 0x920E938C
X-GPG-Keyserver: hkp://keys.gnupg.net
Organization: ChargeStorm AB
User-Agent: Mutt/1.5.23 (2014-03-12)
X-GFI-SMTP-Submission: 1
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
X-List-Received-Date: Wed, 02 Apr 2014 07:50:46 -0000
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Ping...

* Anders Darander <anders@chargestorm.se> [140321 15:30]:

> * Denys Dmytriyenko <denys@ti.com> [140314 17:17]:

> > Yeah, I'm seeing the same breakage even in dylan - I'm looking into it =
now...

> Good to know that I'm not alone in seeing this...

> Any ideas regarding the root cause or possible fixes? Sofar, I've been
> occupied with work on our old release branch, though soon I=CD=84'll start
> working on the update again.

> Cheers,
> Anders

> > On Mon, Mar 10, 2014 at 01:14:28PM +0100, Anders Darander wrote:
> > > Hi,

> > > Summary:

> > > I'm attempting at moving a custom product from meta-arago (danny) to =
the
> > > latest master based on dora.

> > > However, I'm getting issues when I'm building gcc-cross-initial (we're
> > > not using an external toolchain).i

> > > I've seen this on my normal build machine running Ubuntu 12.04, though
> > > my example below was running a new OpenSuse machine.=20
> > > The choice of MACHINE=3D"am37x-evm" is made to get something resembli=
ng
> > > our real machine.

> > > When building gcc-cross-initial, libgcc fails to identify the "suffix=
 of
> > > object files" when the configure-script for libgcc is being run.

> > > I hope that someone can help me with some ideas/pointers as to how th=
is
> > > can be resolved. I've got the same issue with both gcc 4.7.2 and
> > > 4.8.1...
--=20
Anders Darander
ChargeStorm AB / eStorm AB

