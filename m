Return-Path: <hzhang@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id 6928F52A71
	for <meta-arago@arago-project.org>;
	Thu, 25 Apr 2013 00:51:17 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id r3P0pG3j027515
	for <meta-arago@arago-project.org>; Wed, 24 Apr 2013 19:51:16 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id r3P0pGfs019589
	for <meta-arago@arago-project.org>; Wed, 24 Apr 2013 19:51:16 -0500
Received: from DLEE09.ent.ti.com ([fe80::d03e:3cf4:73ad:d589]) by
	DFLE72.ent.ti.com ([fe80::e5e2:bab6:34dc:a483%28]) with mapi id
	14.02.0342.003; Wed, 24 Apr 2013 19:51:16 -0500
From: "Zhang, Hao" <hzhang@ti.com>
To: "Cooper Jr., Franklin" <fcooper@ti.com>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [meta-arago] [PATCH] matrix-lighttpd-config: add static cgi
	and	.out support in Matrix PHP
Thread-Index: AQHOQSA84jUPMMtokUe6fEwZu44OVJjlwMMggABYCACAAAF4IA==
Date: Thu, 25 Apr 2013 00:51:15 +0000
Message-ID: <ECA334CFBA16F74DB2C66A2F1181F4D63C2B20D7@DLEE09.ent.ti.com>
References: <1366828154-17755-1-git-send-email-hzhang@ti.com>
	<8F29D6B095ED194EA1980491A5E029710C4328F5@DFLE08.ent.ti.com>
	<ECA334CFBA16F74DB2C66A2F1181F4D63C2B1F41@DLEE09.ent.ti.com>
	<8F29D6B095ED194EA1980491A5E029710C432969@DFLE08.ent.ti.com>
In-Reply-To: <8F29D6B095ED194EA1980491A5E029710C432969@DFLE08.ent.ti.com>
Accept-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Subject: Re: [PATCH] matrix-lighttpd-config: add static cgi and	.out support in Matrix PHP
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
X-List-Received-Date: Thu, 25 Apr 2013 00:51:18 -0000
X-Groupsio-MsgNum: 1288
Content-Language: en-US
Content-Type: multipart/mixed;
	boundary="_004_ECA334CFBA16F74DB2C66A2F1181F4D63C2B20D7DLEE09entticom_"

--_004_ECA334CFBA16F74DB2C66A2F1181F4D63C2B20D7DLEE09entticom_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Franklin,

I gave you the wrong example, please see attached for the eeprom read/write=
 example, which uses cgi. Our utility examples follow this basic structure =
for a main html page calling the cgi.

Hao.

-----Original Message-----
From: Cooper Jr., Franklin=20
Sent: Wednesday, April 24, 2013 3:41 PM
To: Zhang, Hao; meta-arago@arago-project.org
Subject: RE: [meta-arago] [PATCH] matrix-lighttpd-config: add static cgi an=
d .out support in Matrix PHP

Matrix already has the ability to run shell scripts so I don't understand w=
hy you need this .cgi which still executes shell commands. Is there  some k=
ind of limitation your running into?

Your utility_info.sh would contain:

echo " System Up Time"
cat /proc/uptime

echo "CPU Info"
cat /proc/cpuinfo

echo "Linux version
uname -srm

TMPFILE=3D`mktemp`
mount | awk ' {print "device ", $1," mounted on ",$3, " as ", $5, "filesyst=
em"}' > $TMPFILE

echo "Mount Info"
cat $TMPFILE
rm $TMPFILE

echo "Network Interfaces"

ifconfig

echo "Routing table"
route

echo "Module Info"
lsmod

And your utility_info.desktop will be set to:
Exec=3Dutility_info.sh


> -----Original Message-----
> From: Zhang, Hao
> Sent: Wednesday, April 24, 2013 2:27 PM
> To: Cooper Jr., Franklin; meta-arago@arago-project.org
> Subject: RE: [meta-arago] [PATCH] matrix-lighttpd-config: add static=20
> cgi and .out support in Matrix PHP
>=20
> See attached the example.
>=20
> -----Original Message-----
> From: Cooper Jr., Franklin
> Sent: Wednesday, April 24, 2013 3:17 PM
> To: Zhang, Hao; meta-arago@arago-project.org
> Subject: RE: [meta-arago] [PATCH] matrix-lighttpd-config: add static=20
> cgi and .out support in Matrix PHP
>=20
> cgi.assign                 =3D ( ".php"  =3D> "/usr/bin/php-cgi", ".cgi" =
=3D> "/bin/sh",  ".o" =3D>
> "" )
>=20
> Can you give an example of the .cgi and .o file that requires this change=
?
>=20
>=20
> > -----Original Message-----
> > From: meta-arago-bounces@arago-project.org [mailto:meta-arago-=20
> > bounces@arago-project.org] On Behalf Of Zhang, Hao
> > Sent: Wednesday, April 24, 2013 1:29 PM
> > To: meta-arago@arago-project.org
> > Subject: [meta-arago] [PATCH] matrix-lighttpd-config: add static cgi=20
> > and .out support in Matrix PHP
> >
> > From: Hao Zhang <hzhang@ti.com>
> >
> > ---
> >  .../matrix-lighttpd-config/lighttpd.conf.matrix    |    4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/meta-arago-extras/recipes-core/matrix/matrix-lighttpd-
> > config/lighttpd.conf.matrix b/meta-arago-extras/recipes-=20
> > core/matrix/matrix-lighttpd-config/lighttpd.conf.matrix
> > index 82a9fb8..2dce736 100755
> > --- a/meta-arago-extras/recipes-core/matrix/matrix-lighttpd-
> > config/lighttpd.conf.matrix
> > +++ b/meta-arago-extras/recipes-core/matrix/matrix-lighttpd-config/l
> > +++ ig
> > +++ ht
> > +++ tpd.conf.matrix
> > @@ -137,7 +137,7 @@ $HTTP["url"] =3D~ "\.pdf$" {  # which extensions=20
> > should not be handle via static-file transfer  #  # .php, .pl, .fcgi=20
> > are most often handled by mod_fastcgi or mod_cgi=20
> > -static-file.exclude-extensions =3D ( ".php", ".pl", ".fcgi" )
> > +static-file.exclude-extensions =3D ( ".php", ".pl", ".fcgi", ".cgi", "=
.o"
> > +)
> >
> >  ######### Options that are good to be but not neccesary to be=20
> > changed #######
> >
> > @@ -225,7 +225,7 @@ compress.filetype          =3D ("text/plain",
> > "text/html","text/javascript","text/
> >  #                            )
> >
> >  #### CGI module
> > -cgi.assign                 =3D ( ".php"  =3D> "/usr/bin/php-cgi")
> > +cgi.assign                 =3D ( ".php"  =3D> "/usr/bin/php-cgi", ".cg=
i" =3D>	"/bin/sh",
> > ".o" =3D> "" )
> >  #cgi.assign                 =3D ( ".pl"  =3D> "/usr/bin/perl",
> >  #                               ".cgi" =3D> "/usr/bin/perl" )
> >  #
> > --
> > 1.7.9.5
> >
> > _______________________________________________
> > meta-arago mailing list
> > meta-arago@arago-project.org
> > http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

--_004_ECA334CFBA16F74DB2C66A2F1181F4D63C2B20D7DLEE09entticom_
Content-Type: text/html; name="i2c.html"
Content-Description: i2c.html
Content-Disposition: attachment; filename="i2c.html"; size=4917;
	creation-date="Mon, 15 Apr 2013 18:26:42 GMT";
	modification-date="Mon, 15 Apr 2013 18:29:45 GMT"
Content-Transfer-Encoding: base64

PCFET0NUWVBFIEhUTUwgUFVCTElDICItLy9XM0MvL0RURCBIVE1MIDQuMDEgVHJhbnNpdGlvbmFs
Ly9FTiIgImh0dHA6Ly93d3cudzMub3JnL1RSL2h0bWw0L2xvb3NlLmR0ZCI+CjwhLS0KLyoKICog
Q29weXJpZ2h0IChDKSAyMDEzIFRleGFzIEluc3RydW1lbnRzIEluY29ycG9yYXRlZCAtIGh0dHA6
Ly93d3cudGkuY29tLwogKgogKgogKiAgUmVkaXN0cmlidXRpb24gYW5kIHVzZSBpbiBzb3VyY2Ug
YW5kIGJpbmFyeSBmb3Jtcywgd2l0aCBvciB3aXRob3V0CiAqICBtb2RpZmljYXRpb24sIGFyZSBw
ZXJtaXR0ZWQgcHJvdmlkZWQgdGhhdCB0aGUgZm9sbG93aW5nIGNvbmRpdGlvbnMKICogIGFyZSBt
ZXQ6CiAqCiAqICAgIFJlZGlzdHJpYnV0aW9ucyBvZiBzb3VyY2UgY29kZSBtdXN0IHJldGFpbiB0
aGUgYWJvdmUgY29weXJpZ2h0CiAqICAgIG5vdGljZSwgdGhpcyBsaXN0IG9mIGNvbmRpdGlvbnMg
YW5kIHRoZSBmb2xsb3dpbmcgZGlzY2xhaW1lci4KICoKICogICAgUmVkaXN0cmlidXRpb25zIGlu
IGJpbmFyeSBmb3JtIG11c3QgcmVwcm9kdWNlIHRoZSBhYm92ZSBjb3B5cmlnaHQKICogICAgbm90
aWNlLCB0aGlzIGxpc3Qgb2YgY29uZGl0aW9ucyBhbmQgdGhlIGZvbGxvd2luZyBkaXNjbGFpbWVy
IGluIHRoZQogKiAgICBkb2N1bWVudGF0aW9uIGFuZC9vciBvdGhlciBtYXRlcmlhbHMgcHJvdmlk
ZWQgd2l0aCB0aGUKICogICAgZGlzdHJpYnV0aW9uLgogKgogKiAgICBOZWl0aGVyIHRoZSBuYW1l
IG9mIFRleGFzIEluc3RydW1lbnRzIEluY29ycG9yYXRlZCBub3IgdGhlIG5hbWVzIG9mCiAqICAg
IGl0cyBjb250cmlidXRvcnMgbWF5IGJlIHVzZWQgdG8gZW5kb3JzZSBvciBwcm9tb3RlIHByb2R1
Y3RzIGRlcml2ZWQKICogICAgZnJvbSB0aGlzIHNvZnR3YXJlIHdpdGhvdXQgc3BlY2lmaWMgcHJp
b3Igd3JpdHRlbiBwZXJtaXNzaW9uLgogKgogKiAgVEhJUyBTT0ZUV0FSRSBJUyBQUk9WSURFRCBC
WSBUSEUgQ09QWVJJR0hUIEhPTERFUlMgQU5EIENPTlRSSUJVVE9SUwogKiAgIkFTIElTIiBBTkQg
QU5ZIEVYUFJFU1MgT1IgSU1QTElFRCBXQVJSQU5USUVTLCBJTkNMVURJTkcsIEJVVCBOT1QKICog
IExJTUlURUQgVE8sIFRIRSBJTVBMSUVEIFdBUlJBTlRJRVMgT0YgTUVSQ0hBTlRBQklMSVRZIEFO
RCBGSVRORVNTIEZPUgogKiAgQSBQQVJUSUNVTEFSIFBVUlBPU0UgQVJFIERJU0NMQUlNRUQuIElO
IE5PIEVWRU5UIFNIQUxMIFRIRSBDT1BZUklHSFQKICogIE9XTkVSIE9SIENPTlRSSUJVVE9SUyBC
RSBMSUFCTEUgRk9SIEFOWSBESVJFQ1QsIElORElSRUNULCBJTkNJREVOVEFMLAogKiAgU1BFQ0lB
TCwgRVhFTVBMQVJZLCBPUiBDT05TRVFVRU5USUFMIERBTUFHRVMgKElOQ0xVRElORywgQlVUIE5P
VAogKiAgTElNSVRFRCBUTywgUFJPQ1VSRU1FTlQgT0YgU1VCU1RJVFVURSBHT09EUyBPUiBTRVJW
SUNFUzsgTE9TUyBPRiBVU0UsCiAqICBEQVRBLCBPUiBQUk9GSVRTOyBPUiBCVVNJTkVTUyBJTlRF
UlJVUFRJT04pIEhPV0VWRVIgQ0FVU0VEIEFORCBPTiBBTlkKICogIFRIRU9SWSBPRiBMSUFCSUxJ
VFksIFdIRVRIRVIgSU4gQ09OVFJBQ1QsIFNUUklDVCBMSUFCSUxJVFksIE9SIFRPUlQKICogIChJ
TkNMVURJTkcgTkVHTElHRU5DRSBPUiBPVEhFUldJU0UpIEFSSVNJTkcgSU4gQU5ZIFdBWSBPVVQg
T0YgVEhFIFVTRQogKiAgT0YgVEhJUyBTT0ZUV0FSRSwgRVZFTiBJRiBBRFZJU0VEIE9GIFRIRSBQ
T1NTSUJJTElUWSBPRiBTVUNIIERBTUFHRS4KLS0+CjxodG1sIHhtbG5zPSJodHRwOi8vd3d3Lncz
Lm9yZy8xOTk5L3hodG1sIj4KPGhlYWQ+CjxtZXRhIGh0dHAtZXF1aXY9ImNvbnRlbnQtdHlwZSIg
Y29udGVudD0idGV4dC9odG1sOyBjaGFyc2V0PXV0Zi04IiAvPgo8dGl0bGU+S2V5c3RvbmUgSUkg
VXRpbGl0eSBBcHBsaWNhdGlvbnM8L3RpdGxlPgo8U0NSSVBUIFRZUEU9InRleHQvamF2YXNjcmlw
dCI+CglmdW5jdGlvbiBvcGVucG9wdXAodXJsKQoJewoJICAgIGxvY2F0aW9uLmhyZWY9dXJsOwoJ
fQoJZnVuY3Rpb24gc3VibWl0Rm9ybTEoKQoJewoJCWlmKGRvY3VtZW50LnByZXNzZWQgPT0gJ1dy
aXRlIEVFUFJPTScpCgkJewoJCQlkb2N1bWVudC5pYmxVcGdyYWRlLmFjdGlvbiA9ImFwcHMvdXRp
bGl0eV9lZXByb20vY2dpLWJpbi9lZXByb213cml0ZS5jZ2kiOwoJCX0KCQlyZXR1cm4gdHJ1ZTsK
CX0KCglmdW5jdGlvbiBzdWJtaXRGb3JtMigpCgl7CgkJaWYoZG9jdW1lbnQucHJlc3NlZCA9PSAn
UmVhZCBFRVBST00nKQoJCXsKCQkJZG9jdW1lbnQuZWVwcm9tUmVhZC5hY3Rpb24gPSJhcHBzL3V0
aWxpdHlfZWVwcm9tL2NnaS1iaW4vZWVwcm9tcmVhZC5jZ2kiOwoJCX0KCQlyZXR1cm4gdHJ1ZTsK
CX0KCjwvU0NSSVBUPgo8L2hlYWQ+Cjxib2R5Pgo8ZGl2IGlkPSJ3cmFwcGVyIj4KCTxkaXYgaWQ9
ImxvZ28iPgoJCTxoMT5FRVBST00gVXRpbGl0eTwvaDE+Cgk8L2Rpdj4KCTxkaXYgaWQ9ImhlYWRl
ciI+CgkJPGRpdiBpZD0ibWVudSI+CgkJPC9kaXY+Cgk8L2Rpdj4KPC9kaXY+Cgo8ZGl2IGlkPSJw
YWdlIj4KCTxkaXYgaWQ9ImNvbnRlbnQiPgoJCTxocj4KCQk8dGFibGUgY2VsbHBhZGRpbmc9IjYi
PgoJCQk8dHI+PHRkIHZhbGlnbj0iY2VudGVyIj4KCQkJPGltYWdlIHNyYz0iYXBwcy9pbWFnZXMv
dXRpbGl0aWVzLWM2NngucG5nIj4KCQkJPC90ZD48dGQgd2lkdGg9IjEwMCUiIGFsaWduPSJqdXN0
aWZ5Ij4KCQkJPGgyPlByb2dyYW0gdGhlIEVFUFJPTSBvbiB0aGUgUGxhdGZvcm08L2gyPgoJCQk8
YnI+CgkJCTxwIGNsYXNzPSJEZXNjcmlwdGlvbiI+PGI+RGVzY3JpcHRpb246PC9iPiBUaGlzIHBh
Z2UgYWxsb3dzIHRoZSB1c2VyIHRvIHJlYWQvd3JpdGUgdGhlIEkyQyBFRVBST00uIFdoaWxlIHBy
b2dyYW1taW5nIElCTCB0aGVyZSBpcyBhbiBvcHRpb24gdG8gcmVzdG9yZSB0aGUgZXhpc3Rpbmcg
SUJMIGNvbmZpZ3VyYXRpb24gYWZ0ZXIgdGhlIHVwZ3JhZGUuPC9wPgoJCQk8L3RkPjwvdHI+CgkJ
PC90YWJsZT4KCQk8aHI+CgkJPGJyPgoJCTxkaXYgaWQ9ImVlcHJvbXdyaXRlIiBzdHlsZT0id2lk
dGg6IDkwJTsgbWFyZ2luLWxlZnQ6IDI1cHg7IHBhZGRpbmc6IDJweDsgYm9yZGVyOiAxcHggZ3Jh
eSBzb2xpZDsiPgoJCQk8Zm9ybSBuYW1lPSJpYmxVcGdyYWRlIiBvbnN1Ym1pdD0icmV0dXJuIHN1
Ym1pdEZvcm0xKCk7IiBlbmN0eXBlPSJtdWx0aXBhcnQvZm9ybS1kYXRhIiBtZXRob2Q9InBvc3Qi
PgoJCQk8dGFibGUgYm9yZGVyPSIwIiBjZWxscGFkZGluZz0iNSIgaWQ9ImVlcHJvbXdyaXRldGFi
bGUiIHdpZHRoPSIxMDAlIj4KCQkJCTxjYXB0aW9uPiA8Yj4gSTJDIEVFUFJPTSBXcml0ZSA8L2I+
IDwvY2FwdGlvbj4KCQkJCTx0cj4KCQkJCTx0ZCB3aWR0aD0iMzAlIiBhbGlnbj0ibGVmdCI+STJD
IEJ1cyBBZGRyZXNzPC90ZD4KCQkJCTx0ZCBhbGlnbj0ibGVmdCIgd2lkdGg9IjYwJSI+CgkJCQk8
aW5wdXQgdHlwZT0icmFkaW8iIHZhbHVlPSIweDUwIiBuYW1lPSJidXNBZGRyIj4gMHg1MAoJCQkJ
PGlucHV0IHR5cGU9InJhZGlvIiB2YWx1ZT0iMHg1MSIgY2hlY2tlZCBuYW1lPSJidXNBZGRyIj4g
MHg1MTwvdGQ+CgkJCQk8L3RyPgoJCQkJPHRyPgoJCQkJPHRkIHdpZHRoPSIzMCUiIGFsaWduPSJs
ZWZ0Ij5JbWFnZSBGaWxlPC90ZD4KCQkJCTx0ZCBhbGlnbj0ibGVmdCIgd2lkdGg9IjYwJSI+CgkJ
CQk8aW5wdXQgdHlwZT0iZmlsZSIgIG5hbWU9ImRhdGFmaWxlIiBzaXplPSI0MHB4IiB2YWx1ZT0i
Ij48L3RkPgoJCQkJPC90cj4KCQkJCTx0cj4KCQkJCTx0ZCB3aWR0aD0iOTElIiBhbGlnbj0ibGVm
dCIgY29sc3Bhbj0iMiI+PGlucHV0IHR5cGU9InN1Ym1pdCIgb25jbGljaz0iZG9jdW1lbnQucHJl
c3NlZD10aGlzLnZhbHVlIiB2YWx1ZT0iV3JpdGUgRUVQUk9NIj48L3RkPgoJCQkJPC90cj4KCQkJ
PC90YWJsZT4KCQkJPC9mb3JtPgoJCTwvZGl2PgoJCTxicj4KCQk8ZGl2IGlkPSJlZXByb21SZWFk
IiBzdHlsZT0id2lkdGg6IDkwJTsgbWFyZ2luLWxlZnQ6IDI1cHg7IHBhZGRpbmc6IDJweDsgYm9y
ZGVyOiAxcHggZ3JheSBzb2xpZDsiPgoJCQk8Zm9ybSBuYW1lPSJlZXByb21SZWFkIiBvbnN1Ym1p
dD0icmV0dXJuIHN1Ym1pdEZvcm0yKCk7IiBlbmN0eXBlPSJtdWx0aXBhcnQvZm9ybS1kYXRhIiBt
ZXRob2Q9InBvc3QiPgoJCQk8dGFibGUgYm9yZGVyPSIwIiBjZWxscGFkZGluZz0iNSIgaWQ9ImVl
cHJvbXJlYWR0YWJsZSIgd2lkdGg9IjEwMCUiPgoJCQkJPGNhcHRpb24+IDxiPiBJMkMgRUVQUk9N
IFJlYWQgPC9iPiA8L2NhcHRpb24+CgkJCQk8dHI+CgkJCQk8dGQgd2lkdGg9IjMwJSIgYWxpZ249
ImxlZnQiPkkyQyBCdXMgQWRkcmVzczwvdGQ+CgkJCQk8dGQgYWxpZ249ImxlZnQiIHdpZHRoPSI2
MCUiPgoJCQkJPGlucHV0IHR5cGU9InJhZGlvIiB2YWx1ZT0iMHg1MCIgbmFtZT0iYnVzQWRkciI+
IDB4NTAKCQkJCTxpbnB1dCB0eXBlPSJyYWRpbyIgdmFsdWU9IjB4NTEiIGNoZWNrZWQgbmFtZT0i
YnVzQWRkciI+IDB4NTE8L3RkPgoJCQkJPC90cj4KCQkJCTx0cj4KCQkJCTx0ZCB3aWR0aD0iMzAl
IiBhbGlnbj0ibGVmdCI+PGlucHV0IHR5cGU9InN1Ym1pdCIgdmFsdWU9IlJlYWQgRUVQUk9NIiBv
bmNsaWNrPSJkb2N1bWVudC5wcmVzc2VkPXRoaXMudmFsdWUiPiA8L3RkPgoJCQkJPC90cj4KCQkJ
PC90YWJsZT4KCQkJPC9mb3JtPgoJCTwvZGl2PgoJCTxicj4KCQk8YnI+CgkJPGJyPgoJPC9kaXY+
CgoJPGRpdiBzdHlsZT0iY2xlYXI6IGJvdGg7Ij4mbmJzcDs8L2Rpdj4KPC9kaXY+Cgo8ZGl2IGlk
PSJmb290ZXIiPgoJPHAgaWQ9ImxlZ2FsIj4oIGMgKSAyMDEzIFRleGFzIEluc3RydW1lbnRzIElu
Y29ycG9yYXRlZCZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNw
OyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOzwvcD4KPC9kaXY+Cgo8
L2JvZHk+CjwvaHRtbD4K

--_004_ECA334CFBA16F74DB2C66A2F1181F4D63C2B20D7DLEE09entticom_
Content-Type: application/octet-stream; name="eepromread.cgi"
Content-Description: eepromread.cgi
Content-Disposition: attachment; filename="eepromread.cgi"; size=1732;
	creation-date="Mon, 15 Apr 2013 18:28:45 GMT";
	modification-date="Mon, 15 Apr 2013 18:28:45 GMT"
Content-Transfer-Encoding: base64

IyEvYmluL3NoCmVjaG8gQ29udGVudC10eXBlOiB0ZXh0L2h0bWwKZWNobyAKZWNobyAKCmRpc3Bs
YXlfZm9vdGVyKCkKewpjYXQgPDwgRU9NMgo8ZGl2IHN0eWxlPSdjbGVhcjogYm90aDsnPiZuYnNw
OzwvZGl2Pgo8L2Rpdj4KPGRpdiBpZD0nZm9vdGVyJz48cCBpZD0nbGVnYWwnPiggYyApIDIwMTMg
VGV4YXMgSW5zdHJ1bWVudHMgSW5jb3Jwb3JhdGVkJm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5i
c3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7
Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7PC9wPjwvZGl2Pgo8L2JvZHk+CjwvaHRtbD4K
RU9NMgp9CgpjYXQgPDwgRU9NCjwhRE9DVFlQRSBIVE1MIFBVQkxJQyAnLS8vVzNDLy9EVEQgSFRN
TCA0LjAxIFRyYW5zaXRpb25hbC8vRU4nICdodHRwOi8vd3d3LnczLm9yZy9UUi9odG1sNC9sb29z
ZS5kdGQnPiA8aHRtbCB4bWxucz0naHR0cDovL3d3dy53My5vcmcvMTk5OS94aHRtbCc+CjxoZWFk
PjxtZXRhIGh0dHAtZXF1aXY9J1ByYWdtYScgQ09OVEVOVD0nbm8tY2FjaGUnIC8+IDxtZXRhIGh0
dHAtZXF1aXY9J2NvbnRlbnQtdHlwZScgY29udGVudD0ndGV4dC9odG1sOyBjaGFyc2V0PXV0Zi04
JyAvPiA8dGl0bGU+QzZ4IExpbnV4IFdlYiBDb250cm9sIFBhbmVsPC90aXRsZT4KPC9oZWFkPgo8
Ym9keT4KPGRpdiBpZD0nd3JhcHBlcic+CjxkaXYgaWQ9J2xvZ28nPjxoMT5FRVBST00gUmVhZDwv
aDE+PC9kaXY+CjxkaXYgaWQ9J2hlYWRlcic+CjxkaXYgaWQ9J21lbnUnPgo8L2Rpdj4KPC9kaXY+
CjwvZGl2Pgo8ZGl2IGlkPSdwYWdlJz4KRU9NClRNUEZJTEU9YG1rdGVtcGAKY2F0ID4gJFRNUEZJ
TEUKCmdldF9wYXJhbXMoKQp7CmJ1c0FkZHI9JChjYXQgJFRNUEZJTEUgfCBzZWQgLW4gJzRwJyB8
IHNlZCAncy8uJC8vJykKZWVwcm9tZGV2PSQoZmluZCAvc3lzIC1uYW1lIGVlcHJvbSkKcmVhZFN6
PTEwMDAKZWNobyAkYnVzQWRkcgplY2hvICRlZXByb21kZXYKClRNUEZJTEVfREFUQT0iLi4vaTJj
XyIkYnVzQWRkciIuYmluIgppZiBbICIkYnVzQWRkciIgPSAiMHg1MSIgXSA7IHRoZW4KZGV2T2Zm
c2V0PSRyZWFkU3oKZWxzZQpkZXZPZmZzZXQ9MApmaQplY2hvICRkZXZPZmZzZXQKCgp9CgpjaGVj
a19wYXJhbXMoKQp7CmVjaG8KfQoKI1JlYWQgRUVQUk9NIApyZWFkX2VlcHJvbSgpCnsKY2F0IDw8
IEVPTTEKPGRpdiBpZD0nY29udGVudCc+CjxwPlJlYWRpbmcgPGk+JHJlYWRTejwvaT4gYnl0ZXMg
ZnJvbSBFRVBST00gQnVzIEFkZHJlc3MgPGk+JGJ1c0FkZHI8L2k+IC4uLjwvcD4KPC9kaXY+CkVP
TTEKZGQgb2Y9JFRNUEZJTEVfREFUQSBpZj0kZWVwcm9tZGV2IGJzPTEgY291bnQ9JHJlYWRTeiBz
a2lwPSRkZXZPZmZzZXQgMj4gL2Rldi9udWxsCnN5bmMKfQoKI0FsbG93IFVzZXIgdG8gZG93bmxv
YWQgdGhlIGZpbGUKZmlsZV9kb3dubG9hZCgpCnsKY2F0IDw8IEVPTTEKPGRpdiBpZD0nY29udGVu
dCc+CjxpbnB1dCB0eXBlPSJidXR0b24iIG5hbWU9IkJ1dHRvbiIgdmFsdWU9IlNhdmUgRUVQUk9N
IGRhdGEiIG9uQ2xpY2s9IndpbmRvdy5vcGVuKCckVE1QRklMRV9EQVRBJywgJ2Rvd25sb2FkJyk7
IHJldHVybiBmYWxzZTsiPgo8L2Rpdj4KRU9NMQp9CgpnZXRfcGFyYW1zCmNoZWNrX3BhcmFtcwpy
ZWFkX2VlcHJvbQpmaWxlX2Rvd25sb2FkCgpkaXNwbGF5X2Zvb3RlcgpybSAtZiAkVE1QRklMRQoj
cm0gLWYgJFRNUEZJTEVfREFUQQoKCg==

--_004_ECA334CFBA16F74DB2C66A2F1181F4D63C2B20D7DLEE09entticom_
Content-Type: application/octet-stream; name="eepromwrite.cgi"
Content-Description: eepromwrite.cgi
Content-Disposition: attachment; filename="eepromwrite.cgi"; size=1764;
	creation-date="Mon, 15 Apr 2013 18:28:50 GMT";
	modification-date="Mon, 15 Apr 2013 18:28:50 GMT"
Content-Transfer-Encoding: base64

IyEvYmluL3NoCmVjaG8gQ29udGVudC10eXBlOiB0ZXh0L2h0bWwKZWNobyAKZWNobyAKCmRpc3Bs
YXlfZm9vdGVyKCkKewpjYXQgPDwgRU9NMgo8ZGl2IHN0eWxlPSdjbGVhcjogYm90aDsnPiZuYnNw
OzwvZGl2Pgo8L2Rpdj4KPGRpdiBpZD0nZm9vdGVyJz48cCBpZD0nbGVnYWwnPiggYyApIDIwMTMg
VGV4YXMgSW5zdHJ1bWVudHMgSW5jb3Jwb3JhdGVkJm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5i
c3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7
Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7PGEgaHJlZj0nL2NyZWRpdC5odG1sJz5DcmVk
aXRzPC9hPjwvcD48L2Rpdj4KPC9ib2R5Pgo8L2h0bWw+CkVPTTIKfQoKY2F0IDw8IEVPTQo8IURP
Q1RZUEUgSFRNTCBQVUJMSUMgJy0vL1czQy8vRFREIEhUTUwgNC4wMSBUcmFuc2l0aW9uYWwvL0VO
JyAnaHR0cDovL3d3dy53My5vcmcvVFIvaHRtbDQvbG9vc2UuZHRkJz4gPGh0bWwgeG1sbnM9J2h0
dHA6Ly93d3cudzMub3JnLzE5OTkveGh0bWwnPgo8aGVhZD48bWV0YSBodHRwLWVxdWl2PSdQcmFn
bWEnIENPTlRFTlQ9J25vLWNhY2hlJyAvPiA8bWV0YSBodHRwLWVxdWl2PSdjb250ZW50LXR5cGUn
IGNvbnRlbnQ9J3RleHQvaHRtbDsgY2hhcnNldD11dGYtOCcgLz4gPHRpdGxlPkM2eCBMaW51eCBX
ZWIgQ29udHJvbCBQYW5lbDwvdGl0bGU+CjwvaGVhZD4KPGJvZHk+CjxkaXYgaWQ9J3dyYXBwZXIn
Pgo8ZGl2IGlkPSdsb2dvJz48aDE+RUVQUk9NIFJlYWQ8L2gxPjwvZGl2Pgo8ZGl2IGlkPSdoZWFk
ZXInPgo8ZGl2IGlkPSdtZW51Jz4KPC9kaXY+CjwvZGl2Pgo8L2Rpdj4KPGRpdiBpZD0ncGFnZSc+
CkVPTQpUTVBGSUxFPWBta3RlbXBgCmNhdCA+ICRUTVBGSUxFCgpnZXRfcGFyYW1zKCkKewpidXNB
ZGRyPSQoY2F0ICRUTVBGSUxFIHwgc2VkIC1uICc0cCcgfCBzZWQgJ3MvLiQvLycpCmVlcHJvbWRl
dj0kKGZpbmQgL3N5cyAtbmFtZSBlZXByb20pCnJlYWRTej01MTIKZWNobyAkYnVzQWRkcgplY2hv
ICRlZXByb21kZXYKClRNUEZJTEVfREFUQT0iLi4vaTJjXyIkYnVzQWRkciIuYmluIgppZiBbICIk
YnVzQWRkciIgPSAiMHg1MSIgXSA7IHRoZW4KZGV2T2Zmc2V0PSRyZWFkU3oKZWxzZQpkZXZPZmZz
ZXQ9MApmaQplY2hvICRkZXZPZmZzZXQKCgp9CgpjaGVja19wYXJhbXMoKQp7CmVjaG8KfQoKI1Jl
YWQgRUVQUk9NIApyZWFkX2VlcHJvbSgpCnsKY2F0IDw8IEVPTTEKPGRpdiBpZD0nY29udGVudCc+
CjxwPlJlYWRpbmcgPGk+JHJlYWRTejwvaT4gYnl0ZXMgZnJvbSBFRVBST00gQnVzIEFkZHJlc3Mg
PGk+JGJ1c0FkZHI8L2k+IC4uLjwvcD4KPC9kaXY+CkVPTTEKZGQgb2Y9JFRNUEZJTEVfREFUQSBp
Zj0kZWVwcm9tZGV2IGJzPTEgY291bnQ9JHJlYWRTeiBza2lwPSRkZXZPZmZzZXQgMj4gL2Rldi9u
dWxsCnN5bmMKfQoKI0FsbG93IFVzZXIgdG8gZG93bmxvYWQgdGhlIGZpbGUKZmlsZV9kb3dubG9h
ZCgpCnsKY2F0IDw8IEVPTTEKPGRpdiBpZD0nY29udGVudCc+CjxpbnB1dCB0eXBlPSJidXR0b24i
IG5hbWU9IkJ1dHRvbiIgdmFsdWU9IlNhdmUgRUVQUk9NIGRhdGEiIG9uQ2xpY2s9IndpbmRvdy5v
cGVuKCckVE1QRklMRV9EQVRBJywgJ2Rvd25sb2FkJyk7IHJldHVybiBmYWxzZTsiPgo8L2Rpdj4K
RU9NMQp9CgpnZXRfcGFyYW1zCmNoZWNrX3BhcmFtcwpyZWFkX2VlcHJvbQpmaWxlX2Rvd25sb2Fk
CgpkaXNwbGF5X2Zvb3RlcgpybSAtZiAkVE1QRklMRQpybSAtZiAkVE1QRklMRV9EQVRBCgoK

--_004_ECA334CFBA16F74DB2C66A2F1181F4D63C2B20D7DLEE09entticom_--
