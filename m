Return-Path: <sam.nelson@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 62B95529A0
	for <meta-arago@arago-project.org>;
	Fri, 16 Aug 2013 22:00:11 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id r7GM0AO2005616
	for <meta-arago@arago-project.org>; Fri, 16 Aug 2013 17:00:10 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id r7GM0AiO008849
	for <meta-arago@arago-project.org>; Fri, 16 Aug 2013 17:00:10 -0500
Received: from DLEE11.ent.ti.com ([fe80::40fa:b936:da7c:d113]) by
	DFLE72.ent.ti.com ([fe80::e5e2:bab6:34dc:a483%28]) with mapi id
	14.02.0342.003; Fri, 16 Aug 2013 17:00:10 -0500
From: "Nelson, Sam" <sam.nelson@ti.com>
To: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Thread-Topic: Help needed: Fetch failure
Thread-Index: Ac6ayw1zavq3q+XWTnmpSoulfxikKw==
Date: Fri, 16 Aug 2013 22:00:09 +0000
Message-ID: <4F9216F96E5DF9428610502835A9F4905494FB5E@DLEE11.ent.ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Subject: Help needed: Fetch failure
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
X-List-Received-Date: Fri, 16 Aug 2013 22:00:11 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Encountered the following error when running a yocto build.
Any clues on this  will be appreciated.
With regards,
Sam

Parsing recipes...ERROR: Error executing a python function in <code>:
ExpansionError: Failure expanding variable SRCPV, expression was ${@bb.fetc=
h2.get_srcrev(d)} which triggered exception FetchError: Fetcher failure: Fe=
tch command failed with exit code 128, output:
fatal: The remote end hung up unexpectedly


ERROR: The stack trace of python calls that resulted in this exception/fail=
ure was:
ERROR:   File "<code>", line 2, in <module>
ERROR:=20
ERROR:   File "__anon_567__home_gtbldadm_yocto_mcsdk_3_00_02_13_oe_layerset=
up_mcsdk_sources_oe_core_meta_classes_base_bbclass", line 203, in __anon_56=
7__home_gtbldadm_yocto_mcsdk_3_00_02_13_oe_layersetup_mcsdk_sources_oe_core=
_meta_classes_base_bbclass
ERROR:=20
ERROR:   File "/home/gtbldadm/yocto/mcsdk-3_00_02_13/oe-layersetup-mcsdk/so=
urces/bitbake/lib/bb/data_smart.py", line 293, in getVar
ERROR:     return self.expand(value, var)
ERROR:=20
ERROR:   File "/home/gtbldadm/yocto/mcsdk-3_00_02_13/oe-layersetup-mcsdk/so=
urces/bitbake/lib/bb/data_smart.py", line 157, in expand
ERROR:     return self.expandWithRefs(s, varname).value
ERROR:=20
ERROR:   File "/home/gtbldadm/yocto/mcsdk-3_00_02_13/oe-layersetup-mcsdk/so=
urces/bitbake/lib/bb/data_smart.py", line 140, in expandWithRefs
ERROR:     s =3D __expand_var_regexp__.sub(varparse.var_sub, s)
ERROR:=20
ERROR:   File "/home/gtbldadm/yocto/mcsdk-3_00_02_13/oe-layersetup-mcsdk/so=
urces/bitbake/lib/bb/data_smart.py", line 61, in var_sub
ERROR:     var =3D self.d.getVar(key, True)
ERROR:=20
ERROR:   File "/home/gtbldadm/yocto/mcsdk-3_00_02_13/oe-layersetup-mcsdk/so=
urces/bitbake/lib/bb/data_smart.py", line 293, in getVar
ERROR:     return self.expand(value, var)
ERROR:=20
ERROR:   File "/home/gtbldadm/yocto/mcsdk-3_00_02_13/oe-layersetup-mcsdk/so=
urces/bitbake/lib/bb/data_smart.py", line 157, in expand
ERROR:     return self.expandWithRefs(s, varname).value
ERROR:=20
ERROR:   File "/home/gtbldadm/yocto/mcsdk-3_00_02_13/oe-layersetup-mcsdk/so=
urces/bitbake/lib/bb/data_smart.py", line 140, in expandWithRefs
ERROR:     s =3D __expand_var_regexp__.sub(varparse.var_sub, s)
ERROR:=20
ERROR:   File "/home/gtbldadm/yocto/mcsdk-3_00_02_13/oe-layersetup-mcsdk/so=
urces/bitbake/lib/bb/data_smart.py", line 61, in var_sub
ERROR:     var =3D self.d.getVar(key, True)
ERROR:=20
ERROR:   File "/home/gtbldadm/yocto/mcsdk-3_00_02_13/oe-layersetup-mcsdk/so=
urces/bitbake/lib/bb/data_smart.py", line 293, in getVar
ERROR:     return self.expand(value, var)
ERROR:=20
ERROR:   File "/home/gtbldadm/yocto/mcsdk-3_00_02_13/oe-layersetup-mcsdk/so=
urces/bitbake/lib/bb/data_smart.py", line 157, in expand
ERROR:     return self.expandWithRefs(s, varname).value
ERROR:=20
ERROR:   File "/home/gtbldadm/yocto/mcsdk-3_00_02_13/oe-layersetup-mcsdk/so=
urces/bitbake/lib/bb/data_smart.py", line 140, in expandWithRefs
ERROR:     s =3D __expand_var_regexp__.sub(varparse.var_sub, s)
ERROR:=20
ERROR:   File "/home/gtbldadm/yocto/mcsdk-3_00_02_13/oe-layersetup-mcsdk/so=
urces/bitbake/lib/bb/data_smart.py", line 61, in var_sub
ERROR:     var =3D self.d.getVar(key, True)
ERROR:=20
ERROR:   File "/home/gtbldadm/yocto/mcsdk-3_00_02_13/oe-layersetup-mcsdk/so=
urces/bitbake/lib/bb/data_smart.py", line 293, in getVar
ERROR:     return self.expand(value, var)
ERROR:=20
ERROR:   File "/home/gtbldadm/yocto/mcsdk-3_00_02_13/oe-layersetup-mcsdk/so=
urces/bitbake/lib/bb/data_smart.py", line 157, in expand
ERROR:     return self.expandWithRefs(s, varname).value
ERROR:=20
ERROR:   File "/home/gtbldadm/yocto/mcsdk-3_00_02_13/oe-layersetup-mcsdk/so=
urces/bitbake/lib/bb/data_smart.py", line 147, in expandWithRefs
ERROR:     raise ExpansionError(varname, s, exc)
ERROR:=20
ERROR: The code that was being executed was:
ERROR:      0001:__anon_125__home_gtbldadm_yocto_mcsdk_3_00_02_13_oe_layers=
etup_mcsdk_sources_oe_core_meta_classes_staging_bbclass(d)
ERROR:  *** 0002:__anon_567__home_gtbldadm_yocto_mcsdk_3_00_02_13_oe_layers=
etup_mcsdk_sources_oe_core_meta_classes_base_bbclass(d)
ERROR:      0003:__anon_172__home_gtbldadm_yocto_mcsdk_3_00_02_13_oe_layers=
etup_mcsdk_sources_meta_arago_meta_arago_distro_classes_sourceipk_bbclass(d=
)
ERROR:      0004:__anon_218__home_gtbldadm_yocto_mcsdk_3_00_02_13_oe_layers=
etup_mcsdk_sources_oe_core_meta_classes_package_bbclass(d)
ERROR:      0005:__anon_471__home_gtbldadm_yocto_mcsdk_3_00_02_13_oe_layers=
etup_mcsdk_sources_oe_core_meta_classes_package_ipk_bbclass(d)
ERROR:      0006:__anon_822__home_gtbldadm_yocto_mcsdk_3_00_02_13_oe_layers=
etup_mcsdk_sources_oe_core_meta_classes_insane_bbclass(d)
ERROR: [From file: '<code>', lineno: 2, function: <module>]
ERROR:      0199:    #
ERROR:      0200:    override =3D d.getVar('SRC_URI_OVERRIDES_PACKAGE_ARCH'=
, True)
ERROR:      0201:    if override !=3D '0':
ERROR:      0202:        paths =3D []
ERROR:  *** 0203:        fpaths =3D (d.getVar('FILESPATH', True) or '').spl=
it(':')
ERROR:      0204:        machine =3D d.getVar('MACHINE', True)
ERROR:      0205:        for p in fpaths:
ERROR:      0206:            if os.path.basename(p) =3D=3D machine and os.p=
ath.isdir(p):
ERROR:      0207:                paths.append(p)
ERROR: [From file: '__anon_567__home_gtbldadm_yocto_mcsdk_3_00_02_13_oe_lay=
ersetup_mcsdk_sources_oe_core_meta_classes_base_bbclass', lineno: 203, func=
tion: __anon_567__home_gtbldadm_yocto_mcsdk_3_00_02_13_oe_layersetup_mcsdk_=
sources_oe_core_meta_classes_base_bbclass]
ERROR: Failed to parse recipe: /home/gtbldadm/yocto/mcsdk-3_00_02_13/oe-lay=
ersetup-mcsdk/sources/meta-arago/meta-arago-extras/recipes-devtools/ti-wifi=
-utils/ti-wifi-utils_r5.00.18.bb
ERROR: Command execution failed: Exited with 1

-----Original Message-----
From: Sivarajan, Raj
Sent: Friday, August 16, 2013 1:35 PM
To: Trivedi, Gaurang
Cc: Maupin, Chase; Nelson, Sam; Cooper Jr., Franklin; Saran, Sajesh Kumar; =
Wertz, Beverly; Dmytriyenko, Denys
Subject: RE: [meta-arago] [ARES] Re: help needed: Top nightly failure

Gaurang,

Can you do this?

Raj

_________________________________________________________
Type "http://mcsdk" to get to MCSDK internal landing page (useful links: Su=
pport path, Active Customer Issues)

-----Original Message-----
From: Wertz, Beverly
Sent: Thursday, August 15, 2013 4:24 PM
To: Dmytriyenko, Denys
Cc: Sivarajan, Raj; Maupin, Chase; Nelson, Sam; Trivedi, Gaurang; Cooper Jr=
., Franklin; Saran, Sajesh Kumar
Subject: RE: [meta-arago] [ARES] Re: help needed: Top nightly failure

Just curious, has anyone filed a STARS ticket on this yet?=20

-Beverly

-----Original Message-----
From: Dmytriyenko, Denys
Sent: Wednesday, August 14, 2013 2:33 PM
To: Wertz, Beverly
Cc: Sivarajan, Raj; Maupin, Chase; Nelson, Sam; Trivedi, Gaurang; Cooper Jr=
., Franklin; Saran, Sajesh Kumar
Subject: Re: [meta-arago] [ARES] Re: help needed: Top nightly failure

Please make sure someone files a STARS ticket and follows up with IT...

--
Denys


On Tue, Aug 13, 2013 at 09:15:58PM -0400, Wertz, Beverly wrote:
> All,
>=20
> I hard coded my proxy for 192.94.92.14: proxyzsb02-real.ext.ti.com and=20
> it also appears to be working. No fetch/git failures so far, which is=20
> a very positive sign.
>=20
> -Beverly
>=20
> -----Original Message-----
> From: Dmytriyenko, Denys
> Sent: Tuesday, August 13, 2013 4:05 PM
> To: Wertz, Beverly
> Cc: Sivarajan, Raj; Maupin, Chase; Nelson, Sam; Trivedi, Gaurang;=20
> Cooper Jr., Franklin; Saran, Sajesh Kumar
> Subject: Re: [meta-arago] [ARES] Re: help needed: Top nightly failure
>=20
> Gaurang,
>=20
> Check your GIT_PROXY_COMMAND environment variable and git global config.
>=20
> Also, try unsetting GIT_PROXY_COMMAND and only go with git config:
>=20
> $ unset GIT_PROXY_COMMAND
> $ git config --global core.gitproxy /path/to/git-proxy.sh $ MACHINE=3D...=
 bitbake ...
>=20
> --
> Denys
>=20
>=20
> On Tue, Aug 13, 2013 at 04:16:29PM -0400, Wertz, Beverly wrote:
> > Denys,
> >=20
> > I'm also hitting errors downloading all of the files you have listed=20
> > on our build. I can download those files but it takes a very long=20
> > time to retrieve them through the proxy. I've been guessing that=20
> > when the fetches happen, it times out before the download starts.=20
> > When I download those files on my local Ubuntu and windows boxes=20
> > it's over 2 minutes before the download even starts, sometimes longer.
> >=20
> > -Beverly
> >=20
> >=20
> > -----Original Message-----
> > From: Dmytriyenko, Denys
> > Sent: Tuesday, August 13, 2013 3:12 PM
> > To: Sivarajan, Raj
> > Cc: Maupin, Chase; Nelson, Sam; Trivedi, Gaurang; Cooper Jr.,=20
> > Franklin; Saran, Sajesh Kumar; Wertz, Beverly
> > Subject: Re: [meta-arago] [ARES] Re: help needed: Top nightly=20
> > failure
> >=20
> > I'm actually seeing whole bunch of fetch issues with other packages not=
 related to arago-project.org when trying to build inside TI network and go=
ing through the proxy:
> >=20
> > WARNING: Failed to fetch URL=20
> > http://download.oracle.com/berkeley-db/db-5.3.15.tar.gz, attempting=20
> > MIRRORS if available
> > WARNING: Failed to fetch URL=20
> > http://www.cpan.org/src/5.0/perl-5.14.2.tar.gz, attempting MIRRORS=20
> > if available
> > WARNING: Failed to fetch URL=20
> > http://www.python.org/ftp/python/2.7.3/Python-2.7.3.tar.bz2,=20
> > attempting MIRRORS if available
> > WARNING: Failed to fetch URL=20
> > ftp://ftp.gnu.org/gnu/gettext/gettext-0.18.1.1.tar.gz, attempting=20
> > MIRRORS if available
> > WARNING: Failed to fetch URL=20
> > ftp://ftp.gnu.org/gnu/binutils/binutils-2.20.1a.tar.bz2, attempting=20
> > MIRRORS if available
> >=20
> > All those give the following message:
> >=20
> > ERROR: Fetcher failure: Fetch command failed with exit code 4, output:
> > Read error (Connection timed out) in headers.
> > Read error (Connection timed out) in headers.
> >=20
> >=20
> > I can download any of the above when trying from outside of TI network.=
=20
> > And download starts right away. When trying the same inside TI network,=
 it does connect to the proxy server (webproxy.ext.ti.com), but can sit the=
re for many minutes w/o starting download - the Yocto fetcher calls wget wi=
th "-t 2"=20
> > and "-T 30" flags among others, which means 2 tries and 30 seconds time=
out.
> >=20
> > So, something is definitely wrong with our proxies. BTW, this is not th=
e first time the culprit of failed downloads is in the proxy servers!
> >=20
> > --
> > Denys
> >=20
> >=20
> > On Tue, Aug 13, 2013 at 03:09:20PM -0400, Sivarajan, Raj wrote:
> > > +Sajesh, Beverly
> > >=20
> > > So that they can also use this proxy server to fix the failures for S=
C-MCSDK 2.2 and MCSDK 1.1.
> > >=20
> > > _________________________________________________________
> > > Type "http://mcsdk" to get to MCSDK internal landing page (useful=20
> > > links: Support path, Active Customer Issues)
> > >=20
> > > -----Original Message-----
> > > From: Dmytriyenko, Denys
> > > Sent: Tuesday, August 13, 2013 2:44 PM
> > > To: Maupin, Chase
> > > Cc: Nelson, Sam; Sivarajan, Raj; Trivedi, Gaurang; Cooper Jr.,=20
> > > Franklin
> > > Subject: Re: [meta-arago] [ARES] Re: help needed: Top nightly=20
> > > failure
> > >=20
> > > At some point 2 out of 4 rotating IPs were down - I don't remember if=
 it was the old wwwgate or the new webproxy. Locking to one known good IP i=
s a good workaround, but sticking to it for long time is not good.
> > >=20
> > > Denys
> > >=20
> > >=20
> > > On Tue, Aug 13, 2013 at 02:22:42PM -0400, Maupin, Chase wrote:
> > > > The IP I gave was one of the proxies that gets rotated through that=
 is known to work.
> > > >=20
> > > > Sincerely,
> > > > Chase Maupin
> > > > Integration Team Manager
> > > > Linux Core Product Development
> > > > e-mail: chase.maupin@ti.com
> > > > phone: (214) 567-2950
> > > >=20
> > > > For support:
> > > > Forums - http://community.ti.com/forums/ Wiki -=20
> > > > http://wiki.davincidsp.com/
> > > >=20
> > > >=20
> > > > >-----Original Message-----
> > > > >From: Nelson, Sam
> > > > >Sent: Tuesday, August 13, 2013 12:54 PM
> > > > >To: Dmytriyenko, Denys; Maupin, Chase
> > > > >Cc: Sivarajan, Raj; Trivedi, Gaurang; Cooper Jr., Franklin
> > > > >Subject: RE: [meta-arago] [ARES] Re: help needed: Top nightly=20
> > > > >failure
> > > > >
> > > > >My understanding is that wwwgate.ti.com is planned to be deprecate=
d.=20
> > > > >Webproxy.ext.ti.com is the server supported by IT.
> > > > >Now regarding the 192.94.92.11 server. Is this supported by IT?
> > > > >Who is in charge of maintaining this server long term?
> > > > >
> > > > >Regarding fork of the oe-layersetup scripts repository, I am=20
> > > > >not sure of the history. I will check.
> > > > >With regards,
> > > > >Sam
> > > > >
> > > > >-----Original Message-----
> > > > >From: Dmytriyenko, Denys
> > > > >Sent: Tuesday, August 13, 2013 12:50 PM
> > > > >To: Maupin, Chase
> > > > >Cc: Nelson, Sam; Sivarajan, Raj; Trivedi, Gaurang; Cooper Jr.,=20
> > > > >Franklin
> > > > >Subject: Re: [meta-arago] [ARES] Re: help needed: Top nightly=20
> > > > >failure
> > > > >
> > > > >On Tue, Aug 13, 2013 at 12:48:13PM -0400, Maupin, Chase wrote:
> > > > >> I only ever use wwwgate.ti.com if I'm not using a direct proxy.
> > > > >I've
> > > > >> not been using webproxy.ti.com
> > > > >
> > > > >It's webproxy.ext.ti.com
> > > > >
> > > > >
> > > > >> BTW, why have you forked the oe-layersetup scripts repository?
> > > > >
> > > > >Same reason as for other forks of meta-ti and meta-arago, I guess.=
..
> > > > >
> > > > >
> > > > >> >-----Original Message-----
> > > > >> >From: Nelson, Sam
> > > > >> >Sent: Tuesday, August 13, 2013 11:02 AM
> > > > >> >To: Sivarajan, Raj; Maupin, Chase; Trivedi, Gaurang
> > > > >> >Cc: Dmytriyenko, Denys; Cooper Jr., Franklin
> > > > >> >Subject: RE: [meta-arago] [ARES] Re: help needed: Top=20
> > > > >> >nightly
> > > > >failure
> > > > >> >
> > > > >> >There are couple of actions:
> > > > >> >a) Theory: Webproxy is the problem.
> > > > >> >	I am  trying with the proxy server Chase suggested.
> > > > >> >192.94.92.11.
> > > > >> >b) Theory:  Something in the yocto build process is=20
> > > > >> >affecting
> > > > >this.
> > > > >> >	Because manual git clone works fine most of the time.  But
> > > > >the yocto
> > > > >> >builds failed consistently with webproxy.ti.com with=20
> > > > >> >multiple
> > > > >arago
> > > > >> >gits repos.
> > > > >> >To isolate this:  Chase & Franklin, can you try our MCSDK=20
> > > > >> >yocto
> > > > >build
> > > > >> >in your setup. Preferrably using webproxy.ti.com.
> > > > >> >
> > > > >> >Here is the procedure
> > > > >> >1. Clone the oe-layersetup-mcsdk.git (http://arago-
> > > > >> >project.org/git/people/hzhang/oe-layersetup-mcsdk.git) from
> > > > >Arago
> > > > >> >project
> > > > >> >
> > > > >> >            $ git clone http://arago-=20
> > > > >> >project.org/git/people/hzhang/oe-layersetup-mcsdk.git mcsdk 2.
> > > > >> >            $ cd $Home/mcsdk
> > > > >> >            $ ./oe-layertool-setup.sh -f=20
> > > > >> >configs/arago-linaro- hardfp-config.txt
> > > > >> >
> > > > >> >3. Set up the environment variables and start the build=20
> > > > >> >using
> > > > >the
> > > > >> >configuration file
> > > > >> >
> > > > >> >            $ cd build
> > > > >> >            $ . conf/setenv
> > > > >> >            $ MACHINE=3Dkeystone-evm TOOLCHAIN_BRAND=3Dlinaro
> > > > >bitbake
> > > > >> >tisdk-server-rootfs-image
> > > > >> >
> > > > >> >Appreciate your help.
> > > > >> >With regards,
> > > > >> >Sam
> > > > >> >
> > > > >> >-----Original Message-----
> > > > >> >From: Sivarajan, Raj
> > > > >> >Sent: Tuesday, August 13, 2013 8:56 AM
> > > > >> >To: Maupin, Chase; Trivedi, Gaurang; Nelson, Sam
> > > > >> >Cc: Dmytriyenko, Denys; Cooper Jr., Franklin
> > > > >> >Subject: RE: [meta-arago] [ARES] Re: help needed: Top=20
> > > > >> >nightly
> > > > >failure
> > > > >> >
> > > > >> >Yikes! Forgot the list contains non-TI'ers.
> > > > >> >
> > > > >> >Gaurang, Sam,
> > > > >> >
> > > > >> >Can you confirm the proxy is set properly?
> > > > >> >
> > > > >> >Raj
> > > > >> >
> > > > >> >_________________________________________________________
> > > > >> >Type "http://mcsdk" to get to MCSDK internal landing page
> > > > >(useful
> > > > >> >links: Support path, Active Customer Issues)
> > > > >> >
> > > > >> >
> > > > >> >-----Original Message-----
> > > > >> >From: Maupin, Chase
> > > > >> >Sent: Tuesday, August 13, 2013 8:54 AM
> > > > >> >To: Sivarajan, Raj
> > > > >> >Cc: Dmytriyenko, Denys; Cooper Jr., Franklin
> > > > >> >Subject: RE: [meta-arago] [ARES] Re: help needed: Top=20
> > > > >> >nightly
> > > > >failure
> > > > >> >
> > > > >> >Pulling the public list here since this is starting to=20
> > > > >> >mention customers, projects, and TI internals.
> > > > >> >
> > > > >> >If your proxy is using wwwgate.ti.com we have seen that this=20
> > > > >> >is
> > > > >a
> > > > >> >rotating proxy and in the past there has been a proxy change=20
> > > > >> >on
> > > > >one
> > > > >> >or two servers that could cause intermittent failures.
> > > > >> >
> > > > >> >I am able to clone these repos myself with no issue, but the
> > > > >proxy I
> > > > >> >am using is 192.94.92.11
> > > > >> >
> > > > >> >I would say that if Franklin and myself inside of TI, and=20
> > > > >> >Denys outside of TI can clone without an issue you need to=20
> > > > >> >work with
> > > > >IT as
> > > > >> >to why your clones are failing.  Perhaps try changing the=20
> > > > >> >proxy
> > > > >to a
> > > > >> >known good proxy like the one I gave above and see how your
> > > > >build
> > > > >> >goes.
> > > > >> >
> > > > >> >Sincerely,
> > > > >> >Chase Maupin
> > > > >> >Integration Team Manager
> > > > >> >Linux Core Product Development
> > > > >> >e-mail: chase.maupin@ti.com
> > > > >> >phone: (214) 567-2950
> > > > >> >
> > > > >> >For support:
> > > > >> >Forums - http://community.ti.com/forums/ Wiki -=20
> > > > >> >http://wiki.davincidsp.com/
> > > > >> >
> > > > >> >
> > > > >> >>-----Original Message-----
> > > > >> >>From: meta-arago-bounces@arago-project.org=20
> > > > >> >>[mailto:meta-arago- bounces@arago-project.org] On Behalf Of=20
> > > > >> >>Sivarajan, Raj
> > > > >> >>Sent: Tuesday, August 13, 2013 7:43 AM
> > > > >> >>To: Dmytriyenko, Denys; Cooper Jr., Franklin
> > > > >> >>Cc: ares-team@list.ti.com - Raj Sivarajan's Team (May=20
> > > > >> >>contain
> > > > >> >non-
> > > > >> >>TIers); meta-arago@arago-project.org; Mills, William;=20
> > > > >> >>Trivedi,
> > > > >> >Gaurang
> > > > >> >>Subject: Re: [meta-arago] [ARES] Re: help needed: Top=20
> > > > >> >>nightly
> > > > >> >failure
> > > > >> >>Importance: High
> > > > >> >>
> > > > >> >>Denys, Franklin,
> > > > >> >>
> > > > >> >>Thanks for the suggestions. Sam was trying to manually
> > > > >download
> > > > >> >the
> > > > >> >>failing packages to the local mirror yesterday, but last
> > > > >night's
> > > > >> >build
> > > > >> >>failed as well.
> > > > >> >>
> > > > >> >>One question is what happened Thursday/Friday to start=20
> > > > >> >>causing
> > > > >> >this
> > > > >> >>problem? The nightly builds were running successfully prior=20
> > > > >> >>to
> > > > >> >that
> > > > >> >>day.
> > > > >> >>
> > > > >> >>Is there someone we can contact to help? This is a=20
> > > > >> >>production
> > > > >> >stop for
> > > > >> >>a Beta release that is going to partners for the=20
> > > > >> >>Ericsson/EPiC
> > > > >CI
> > > > >> >>project, so it is urgent.
> > > > >> >>
> > > > >> >>Thanks,
> > > > >> >>Raj
> > > > >> >>_________________________________________________________
> > > > >> >>Type "http://mcsdk" to get to MCSDK internal landing page
> > > > >(useful
> > > > >> >>links: Support path, Active Customer Issues)
> > > > >> >>
> > > > >> >>-----Original Message-----
> > > > >> >>From: Dmytriyenko, Denys
> > > > >> >>Sent: Monday, August 12, 2013 9:53 PM
> > > > >> >>To: Cooper Jr., Franklin
> > > > >> >>Cc: Saran, Sajesh Kumar; Nelson, Sam; meta-arago@arago-
> > > > >> >project.org;
> > > > >> >>ares-team@list.ti.com - Raj Sivarajan's Team (May contain=20
> > > > >> >>non-
> > > > >> >TIers)
> > > > >> >>Subject: [ARES] Re: [meta-arago] help needed: Top nightly
> > > > >failure
> > > > >> >>
> > > > >> >>Same here - my git clones I started earlier did not fail. I=20
> > > > >> >>am
> > > > >> >trying
> > > > >> >>it outside of TI network, so not going through the proxy.
> > > > >> >>But I'm not seeing anything wrong with the arago server.
> > > > >> >>
> > > > >> >>--
> > > > >> >>Denys
> > > > >> >>
> > > > >> >>
> > > > >> >>On Mon, Aug 12, 2013 at 09:39:36PM -0400, Cooper Jr.,=20
> > > > >> >>Franklin
> > > > >> >>wrote:
> > > > >> >>> I don't know if there is more history regarding this=20
> > > > >> >>> issue
> > > > >but
> > > > >> >>for what it's
> > > > >> >>> worth I was able to execute the command I mentioned in=20
> > > > >> >>> the
> > > > >> >>previous email. I
> > > > >> >>> would be happy to upload it so you can copy it to your
> > > > >download
> > > > >> >>directory to
> > > > >> >>> work around this issue for the time being.
> > > > >> >>>
> > > > >> >>> > -----Original Message-----
> > > > >> >>> > From: Saran, Sajesh Kumar
> > > > >> >>> > Sent: Monday, August 12, 2013 7:31 PM
> > > > >> >>> > To: Cooper Jr., Franklin; Dmytriyenko, Denys; Nelson,=20
> > > > >> >>> > Sam
> > > > >> >>> > Cc: meta-arago@arago-project.org; ares-team@list.ti.com=20
> > > > >> >>> > -
> > > > >Raj
> > > > >> >>Sivarajan's
> > > > >> >>> > Team (May contain non-TIers)
> > > > >> >>> > Subject: RE: [meta-arago] help needed: Top nightly=20
> > > > >> >>> > failure
> > > > >> >>> >
> > > > >> >>> > This is a reproducible issue. I guess git cloning from
> > > > >arago-
> > > > >> >>project is a problem.
> > > > >> >>> > I got another e-mail (attached) that cloning of linux-
> > > > >davinci
> > > > >> >>is also have similar
> > > > >> >>> > issue.
> > > > >> >>> >
> > > > >> >>> > Regards,
> > > > >> >>> > Sajesh
> > > > >> >>> >
> > > > >> >>> > -----Original Message-----
> > > > >> >>> > From: Cooper Jr., Franklin
> > > > >> >>> > Sent: Monday, August 12, 2013 6:46 PM
> > > > >> >>> > To: Dmytriyenko, Denys; Nelson, Sam
> > > > >> >>> > Cc: meta-arago@arago-project.org; ares-team@list.ti.com=20
> > > > >> >>> > -
> > > > >Raj
> > > > >> >>Sivarajan's
> > > > >> >>> > Team (May contain non-TIers)
> > > > >> >>> > Subject: [ARES] RE: [meta-arago] help needed: Top=20
> > > > >> >>> > nightly
> > > > >> >>failure
> > > > >> >>> >
> > > > >> >>> > If this is blocking your release and your able to clone
> > > > >> >>locally you could also
> > > > >> >>> > workaround this issue by cloning it manually and then
> > > > >placing
> > > > >> >>it in your
> > > > >> >>> > downloads directory.
> > > > >> >>> > Based on your log bitbake is simply running the=20
> > > > >> >>> > following
> > > > >> >>command so you can
> > > > >> >>> > run this command manually:
> > > > >> >>> > git clone --bare --mirror git://arago-
> > > > >> >>project.org/git/projects/linux-tci6614.git
> > > > >> >>> > /home/a0756824/sc_mcsdk/oe-layersetup-
> > > > >> >>mcsdk/downloads/git2/arago-
> > > > >> >>> > project.org.git.projects.linux-tci6614.git
> > > > >> >>> >
> > > > >> >>> >
> > > > >> >>> >
> > > > >> >>> > > -----Original Message-----
> > > > >> >>> > > From: meta-arago-bounces@arago-project.org=20
> > > > >> >>> > > [mailto:meta-
> > > > >> >>arago-
> > > > >> >>> > > bounces@arago-project.org] On Behalf Of Dmytriyenko,
> > > > >Denys
> > > > >> >>> > > Sent: Monday, August 12, 2013 5:31 PM
> > > > >> >>> > > To: Nelson, Sam
> > > > >> >>> > > Cc: meta-arago@arago-project.org;=20
> > > > >> >>> > > ares-team@list.ti.com
> > > > >-
> > > > >> >>Raj
> > > > >> >>> > > Sivarajan's Team (May contain non-TIers)
> > > > >> >>> > > Subject: Re: [meta-arago] help needed: Top nightly
> > > > >failure
> > > > >> >>> > >
> > > > >> >>> > > Sam,
> > > > >> >>> > >
> > > > >> >>> > > I have already mentioned many times that you should=20
> > > > >> >>> > > use
> > > > >a
> > > > >> >>mirror...
> > > > >> >>> > >
> > > > >> >>> > > I don't see any problems with the server and I'm=20
> > > > >> >>> > > cloning
> > > > >> >>your trees
> > > > >> >>> > > right now w/o problems so far. You may want to check
> > > > >your
> > > > >> >>proxy setup as
> > > > >> >>> > well.
> > > > >> >>> > >
> > > > >> >>> > > BTW, did repacking the linux-keystone help for your
> > > > >> >>nightlies? I can
> > > > >> >>> > > do the same for linux-tci6614 too...
> > > > >> >>> > >
> > > > >> >>> > > --
> > > > >> >>> > > Denys
> > > > >> >>> > >
> > > > >> >>> > >
> > > > >> >>> > > On Mon, Aug 12, 2013 at 06:22:11PM -0400, Nelson, Sam
> > > > >> >wrote:
> > > > >> >>> > > > Denys,
> > > > >> >>> > > > This is blocking the MCSDK 3.0.2 & SCMCSDK-2.2.0
> > > > >releases
> > > > >> >>and
> > > > >> >>> > > > appreciate
> > > > >> >>> > > any
> > > > >> >>> > > > help in resolving this issue.
> > > > >> >>> > > >
> > > > >> >>> > > > With regards,
> > > > >> >>> > > > Sam
> > > > >> >>> > > >
> > > > >> >>> > > > -----Original Message-----
> > > > >> >>> > > > From: Nelson, Sam
> > > > >> >>> > > > Sent: Monday, August 12, 2013 12:27 PM
> > > > >> >>> > > > To: Dmytriyenko, Denys
> > > > >> >>> > > > Cc: 'meta-arago@arago-project.org'; Sivarajan, Raj;=20
> > > > >> >>> > > > ares-team@list.ti.com -
> > > > >> >>> > > Raj Sivarajan's Team (May contain non-TIers)
> > > > >> >>> > > > Subject: RE: help needed: Top nightly failure
> > > > >> >>> > > >
> > > > >> >>> > > > Also  yocto builds using=20
> > > > >> >>> > > > git://arago-project.org/git/projects/linux-tci6614.
> > > > >> >>> > > > git
> > > > >> >>> > > also failing for the past 3 days.
> > > > >> >>> > > >
> > > > >> >>> > > > Looks like there is no issue in cloning the repos.=20
> > > > >> >>> > > > But
> > > > >> >>only the
> > > > >> >>> > > > yocto fetch
> > > > >> >>> > > operation is failing.
> > > > >> >>> > > >
> > > > >> >>> > > > From the logs there is no information about what is
> > > > >the
> > > > >> >>actual
> > > > >> >>> > > > command ,
> > > > >> >>> > > which failed.
> > > > >> >>> > > > With regards,
> > > > >> >>> > > > Sam
> > > > >> >>> > > > -----Original Message-----
> > > > >> >>> > > > From: Nelson, Sam
> > > > >> >>> > > > Sent: Monday, August 12, 2013 10:57 AM
> > > > >> >>> > > > To: Dmytriyenko, Denys
> > > > >> >>> > > > Cc: meta-arago@arago-project.org; Sivarajan, Raj;=20
> > > > >> >>> > > > ares-team@list.ti.com - Raj
> > > > >> >>> > > Sivarajan's Team (May contain non-TIers)
> > > > >> >>> > > > Subject: RE: help needed: Top nightly failure
> > > > >> >>> > > > Importance: High
> > > > >> >>> > > >
> > > > >> >>> > > > Hello Denys,
> > > > >> >>> > > > Now starting Thursday, our builds are failing now
> > > > >> >>consistently.
> > > > >> >>> > > > Did something change in the repos?
> > > > >> >>> > > > WARNING: Failed to fetch URL
> > > > >> >>> > > > git://arago-project.org/git/projects/linux-
> > > > >> >>> > > keystone.git;protocol=3Dgit;branch=3Dcurrent/master,
> > > > >attempting
> > > > >> >>MIRRORS if
> > > > >> >>> > > available
> > > > >> >>> > > > ERROR: Fetcher failure: Fetch command failed with=20
> > > > >> >>> > > > exit
> > > > >> >>code 128, output:
> > > > >> >>> > > > Cloning into bare repository=20
> > > > >> >>> > > > '/home/a0862859/yocto/oe-
> > > > >> >>layersetup-
> > > > >> >>> > > mcsdk/downloads/git2/arago-
> > > > >project.org.git.projects.linux-
> > > > >> >>keystone.git'...
> > > > >> >>> > > >
> > > > >> >>> > > > fatal: The remote end hung up unexpectedly
> > > > >> >>> > > > fatal: early EOF
> > > > >> >>> > > > fatal: index-pack failed
> > > > >> >>> > > >
> > > > >> >>> > > > ERROR: Function failed: Fetcher failure for URL:
> > > > >> >>'git://arago-
> > > > >> >>> > > project.org/git/projects/linux-=20
> > > > >> >>> > > keystone.git;protocol=3Dgit;branch=3Dcurrent/master'.=20
> > > > >> >>> > > Unable
> > > > >to
> > > > >> >>fetch URL
> > > > >> >>> > > from any source.
> > > > >> >>> > > > ERROR: Logfile of failure stored in:
> > > > >> >>> > > > /home/a0862859/yocto/oe-layersetup-
> > > > >> >>> > > mcsdk/build/arago-tmp-external-linaro-
> > > > >> >>toolchain/work/keystone_evm-oe-
> > > > >> >>> > > linux-gnueabi/linux-keystone-3.8.4-
> > > > >> >>r6a/temp/log.do_fetch.31058
> > > > >> >>> > > > ERROR: Task 684=20
> > > > >> >>> > > > (/home/a0862859/yocto/oe-layersetup-
> > > > >> >>> > > mcsdk/sources/meta-ti/recipes-kernel/linux/linux-
> > > > >> >>keystone_3.8.4.bb,
> > > > >> >>> > > do_fetch) failed with exit code '1'
> > > > >> >>> > > > NOTE: Tasks Summary: Attempted 3212 tasks of which
> > > > >3211
> > > > >> >>didn't need
> > > > >> >>> > > > to be
> > > > >> >>> > > rerun and 1 failed.
> > > > >> >>> > > > No currently running tasks (351 of 3340)
> > > > >> >>> > > >
> > > > >> >>> > > > With regards,
> > > > >> >>> > > > Sam
> > > > >> >>> > > >
> > > > >> >>> > > > -----Original Message-----
> > > > >> >>> > > > From: Dmytriyenko, Denys
> > > > >> >>> > > > Sent: Thursday, August 08, 2013 10:09 PM
> > > > >> >>> > > > To: Nelson, Sam
> > > > >> >>> > > > Cc: meta-arago@arago-project.org; Sivarajan, Raj
> > > > >> >>> > > > Subject: Re: help needed: Top nightly failure
> > > > >> >>> > > >
> > > > >> >>> > > > Sam,
> > > > >> >>> > > >
> > > > >> >>> > > > Please use a mirror and/or previously cloned repos
> > > > >from
> > > > >> >>downloads/
> > > > >> >>> > > > directory
> > > > >> >>> > > - cloning the entire tree every night is not=20
> > > > >> >>> > > recommended
> > > > >> >and
> > > > >> >>is rather abusive.
> > > > >> >>> > > >
> > > > >> >>> > > > Also, I've repacked the linux-keystone repository=20
> > > > >> >>> > > > so
> > > > >it
> > > > >> >is
> > > > >> >>now
> > > > >> >>> > > > smaller - please
> > > > >> >>> > > let me know if you still see the problem.
> > > > >> >>> > > >
> > > > >> >>> > > > --
> > > > >> >>> > > > Denys
> > > > >> >>> > > >
> > > > >> >>> > > >
> > > > >> >>> > > > On Fri, Aug 02, 2013 at 06:20:08AM -0400, Nelson,=20
> > > > >> >>> > > > Sam
> > > > >> >>wrote:
> > > > >> >>> > > > >    Hello All
> > > > >> >>> > > > >
> > > > >> >>> > > > >
> > > > >> >>> > > > >
> > > > >> >>> > > > >    We are encountering a lot of nightly failures
> > > > >with
> > > > >> >>fetch failure like the
> > > > >> >>> > > > >    following from the arago-project git.  The=20
> > > > >> >>> > > > > error
> > > > >> >>happens randomly and
> > > > >> >>> > > > >    unpredictably.
> > > > >> >>> > > > >
> > > > >> >>> > > > >    Is this something to do with git servers going
> > > > >> >>down/offline?
> > > > >> >>> > > > >
> > > > >> >>> > > > >    Any ideas in tracking this type of issue will=20
> > > > >> >>> > > > > be
> > > > >> >>appreciated.
> > > > >> >>> > > > >
> > > > >> >>> > > > >
> > > > >> >>> > > > >
> > > > >> >>> > > > >    With regards,
> > > > >> >>> > > > >
> > > > >> >>> > > > >    Sam
> > > > >> >>> > > > >
> > > > >> >>> > > > >
> > > > >> >>> > > > >
> > > > >> >>> > > > >    ERROR: Fetcher failure: Fetch command failed=20
> > > > >> >>> > > > > with
> > > > >> >>exit code 128,
> > > > >> >>> > output:
> > > > >> >>> > > > >
> > > > >> >>> > > > >    Cloning into bare repository
> > > > >> >>> > > > >    '/home/gtbldadm/yocto/mcsdk-3_00_01_12/oe-
> > > > >> >layersetup-
> > > > >> >>> > > mcsdk/downloads/git2/arago-
> > > > >project.org.git.projects.linux-
> > > > >> >>keystone.git'...
> > > > >> >>> > > > >
> > > > >> >>> > > > >
> > > > >> >>> > > > >
> > > > >> >>> > > > >    fatal: The remote end hung up unexpectedly
> > > > >> >>> > > > >
> > > > >> >>> > > > >    fatal: early EOF
> > > > >> >>> > > > >
> > > > >> >>> > > > >    fatal: index-pack failed
> > > > >> >>> > > > >
> > > > >> >>> > > > >
> > > > >> >>> > > > >
> > > > >> >>> > > > >    ERROR: Function failed: Fetcher failure for URL:
> > > > >> >>> > > > >    'git://arago-project.org/git/projects/linux-
> > > > >> >>> > > keystone.git;protocol=3Dgit;branch=3Djuly-2013b/master'.
> > > > >> >>> > > > >    Unable to fetch URL from any source.
> > > > >> >>> > > > >
> > > > >> >>> > > > >    ERROR: Logfile of failure stored in:
> > > > >> >>> > > > >    /home/gtbldadm/yocto/mcsdk-3_00_01_12/oe-
> > > > >layersetup-
> > > > >> >>> > > mcsdk/build/arago-tmp-external-linaro-
> > > > >> >>toolchain/work/keystone_evm-oe-
> > > > >> >>> > > linux-gnueabi/linux-keystone-3.8.4-
> > > > >> >>r6a/temp/log.do_fetch.14929
> > > > >> >>> > > > >
> > > > >> >>> > > > >
> > > > >> >>> > > _______________________________________________
> > > > >> >>> > > meta-arago mailing list meta-arago@arago-project.org
> > > > >> >>> > > http://arago-project.org/cgi-bin/mailman/listinfo/met
> > > > >> >>> > > a-
> > > > >> >arago
> > > > >> >>_______________________________________________
> > > > >> >>meta-arago mailing list
> > > > >> >>meta-arago@arago-project.org=20
> > > > >> >>http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

