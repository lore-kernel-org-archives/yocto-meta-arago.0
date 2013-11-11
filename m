Return-Path: <chase.maupin@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 4817552998
	for <meta-arago@arago-project.org>;
	Mon, 11 Nov 2013 19:42:23 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id rABJgLrF009251
	for <meta-arago@arago-project.org>; Mon, 11 Nov 2013 13:42:21 -0600
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id rABJgLm2016780
	for <meta-arago@arago-project.org>; Mon, 11 Nov 2013 13:42:21 -0600
Received: from DLEE11.ent.ti.com ([fe80::40fa:b936:da7c:d113]) by
	DFLE73.ent.ti.com ([fe80::c9be:a3a9:7cd8:c8b3%28]) with mapi id
	14.02.0342.003; Mon, 11 Nov 2013 13:42:21 -0600
From: "Maupin, Chase" <chase.maupin@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: [meta-arago] [PATCH 4/4] arago-test: add linaro-pm-qa-utils to
	test	packages
Thread-Index: AQHO3vh7SZr1wTzVrU6bhsRMtI0sPpogYEFQgAAC7QCAAAUfgIAAZmYA//+caUCAAGZ0gP//nKXQ
Date: Mon, 11 Nov 2013 19:42:21 +0000
Message-ID: <7D46E86EC0A8354091174257B2FED1015980C216@DLEE11.ent.ti.com>
References: <1384189628-21944-1-git-send-email-Chase.Maupin@ti.com>
	<1384189628-21944-4-git-send-email-Chase.Maupin@ti.com>
	<8F29D6B095ED194EA1980491A5E029710C59CF0B@DFLE08.ent.ti.com>
	<7D46E86EC0A8354091174257B2FED1015980BE91@DLEE11.ent.ti.com>
	<7D46E86EC0A8354091174257B2FED1015980BED0@DLEE11.ent.ti.com>
	<20131111192716.GC24766@denix.org>
	<7D46E86EC0A8354091174257B2FED1015980C101@DLEE11.ent.ti.com>
	<20131111193731.GG24766@denix.org>
In-Reply-To: <20131111193731.GG24766@denix.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>, "Cooper
	Jr., Franklin" <fcooper@ti.com>
Subject: Re: [PATCH 4/4] arago-test: add linaro-pm-qa-utils to test	packages
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
X-List-Received-Date: Mon, 11 Nov 2013 19:42:24 -0000
Content-Language: en-US
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

>-----Original Message-----
>From: Dmytriyenko, Denys
>Sent: Monday, November 11, 2013 1:38 PM
>To: Maupin, Chase
>Cc: meta-arago@arago-project.org; Cooper Jr., Franklin
>Subject: Re: [meta-arago] [PATCH 4/4] arago-test: add linaro-pm-
>qa-utils to test packages
>
>On Mon, Nov 11, 2013 at 07:31:40PM +0000, Maupin, Chase wrote:
>> >-----Original Message-----
>> >From: Dmytriyenko, Denys
>> >Sent: Monday, November 11, 2013 1:27 PM
>> >To: Maupin, Chase
>> >Cc: Cooper Jr., Franklin; meta-arago@arago-project.org
>> >Subject: Re: [meta-arago] [PATCH 4/4] arago-test: add linaro-
>pm-
>> >qa-utils to test packages
>> >
>> >AFAIK, ltp-ddt in meta-oe is very old and hasn't been updated
>in
>> >years. I
>> >doubt that particular one had any thermal features.
>> >
>> >It should be Ok to add this dependency in meta-arago in
>bbappend,
>> >once these
>> >recipes land in meta-linaro, since we already have such
>> >dependency.
>>
>> Any idea who to work with for meta-linaro?
>>
>> And can't this dependency be added now since even before it
>lands in
>> meta-linaro it will be in meta-arago?
>
>Try linaro-dev@lists.linaro.org:
>http://lists.linaro.org/mailman/listinfo/linaro-dev
>
>Fathi Boudra has been responsive lately... Not sure if Koen will
>own that
>layer now. Either way, sending to the list is best, just add
>[meta-linaro]
>prefix...

Thanks.  As for this patch, how does it look to you before I send it on?

>
>
>> >On Mon, Nov 11, 2013 at 07:22:27PM +0000, Maupin, Chase wrote:
>> >> Denys,
>> >>
>> >> I could use some advice here though.  Ltp-ddt sits in meta-
>> >openembedded so
>> >> even if we get the pm-utils into meta-linaro we still should
>not
>> >introduce
>> >> this dependency between layers right?
>> >>
>> >> However, we do append ltp-ddt in meta-arago so if we
>introduce
>> >this
>> >> dependency there would that be an issue?
>> >>
>> >> What do you think about how to handle this?
>> >>
>> >> >-----Original Message-----
>> >> >From: meta-arago-bounces@arago-project.org [mailto:meta-
>arago-
>> >> >bounces@arago-project.org] On Behalf Of Maupin, Chase
>> >> >Sent: Monday, November 11, 2013 1:19 PM
>> >> >To: Cooper Jr., Franklin; meta-arago@arago-project.org
>> >> >Subject: Re: [meta-arago] [PATCH 4/4] arago-test: add
>linaro-
>> >pm-
>> >> >qa-utils to test packages
>> >> >
>> >> >Good point.
>> >> >
>> >> >Sincerely,
>> >> >Chase Maupin
>> >> >Integration Team Manager
>> >> >Linux Core Product Development
>> >> >e-mail: chase.maupin@ti.com
>> >> >phone: (214) 567-2950
>> >> >
>> >> >For support:
>> >> >Forums - http://community.ti.com/forums/
>> >> >Wiki - http://wiki.davincidsp.com/
>> >> >
>> >> >
>> >> >>-----Original Message-----
>> >> >>From: Cooper Jr., Franklin
>> >> >>Sent: Monday, November 11, 2013 12:54 PM
>> >> >>To: Maupin, Chase; meta-arago@arago-project.org
>> >> >>Subject: RE: [meta-arago] [PATCH 4/4] arago-test: add
>linaro-
>> >pm-
>> >> >>qa-utils to test packages
>> >> >>
>> >> >>The current patch is fine as is but should there be another
>> >patch
>> >> >>that makes ltp-ddt RDEPENDS on linaro-pm-qa-utils?
>> >> >>
>> >> >>> -----Original Message-----
>> >> >>> From: meta-arago-bounces@arago-project.org [mailto:meta-
>> >arago-
>> >> >>> bounces@arago-project.org] On Behalf Of Maupin, Chase
>> >> >>> Sent: Monday, November 11, 2013 11:07 AM
>> >> >>> To: meta-arago@arago-project.org
>> >> >>> Subject: [meta-arago] [PATCH 4/4] arago-test: add linaro-
>pm-
>> >qa-
>> >> >>utils to test
>> >> >>> packages
>> >> >>>
>> >> >>> Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
>> >> >>> ---
>> >> >>>  .../packagegroups/packagegroup-arago-test.bb       |
>3
>> >++-
>> >> >>>  1 files changed, 2 insertions(+), 1 deletions(-)
>> >> >>>
>> >> >>> diff --git a/meta-arago-distro/recipes-
>> >> >>core/packagegroups/packagegroup-
>> >> >>> arago-test.bb b/meta-arago-distro/recipes-
>> >> >>core/packagegroups/packagegroup-
>> >> >>> arago-test.bb
>> >> >>> index 35fa627..58ecd83 100644
>> >> >>> --- a/meta-arago-distro/recipes-
>> >> >core/packagegroups/packagegroup-
>> >> >>arago-
>> >> >>> test.bb
>> >> >>> +++ b/meta-arago-distro/recipes-
>> >> >core/packagegroups/packagegroup-
>> >> >>arago-
>> >> >>> test.bb
>> >> >>> @@ -1,6 +1,6 @@
>> >> >>>  DESCRIPTION =3D "Extended task to get System Test specific
>> >apps"
>> >> >>>  LICENSE =3D "MIT"
>> >> >>> -PR =3D "r9"
>> >> >>> +PR =3D "r10"
>> >> >>>
>> >> >>>  inherit packagegroup
>> >> >>>
>> >> >>> @@ -21,6 +21,7 @@ ARAGO_TEST =3D "\
>> >> >>>  ARAGO_TI_TEST =3D "\
>> >> >>>      ltp-ddt \
>> >> >>>      input-utils \
>> >> >>> +    linaro-pm-qa-utils \
>> >> >>>      "
>> >> >>>
>> >> >>>  ARAGO_TI_TEST_append_omap-a15 =3D " \
>> >> >>> --
>> >> >>> 1.7.0.4
>> >> >>>
>> >> >>> _______________________________________________
>> >> >>> meta-arago mailing list
>> >> >>> meta-arago@arago-project.org
>> >> >>> http://arago-project.org/cgi-bin/mailman/listinfo/meta-
>arago
>> >> >_______________________________________________
>> >> >meta-arago mailing list
>> >> >meta-arago@arago-project.org
>> >> >http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
>> >> _______________________________________________
>> >> meta-arago mailing list
>> >> meta-arago@arago-project.org
>> >> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
>> >>
>> _______________________________________________
>> meta-arago mailing list
>> meta-arago@arago-project.org
>> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
>>

