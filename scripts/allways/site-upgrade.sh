#!/bin/sh

. /usr/local/orca/etc/jma-receipt.env

# compile COBOL programs
for f in `ls ${SITESRCDIR}/cobol`; do
  if test "x`echo -n $f | grep 'CBL$'`" != "x"; then
    m=`echo $f | sed 's/CBL$/so/'`
    echo -n "Building ${m}..."
    cobc -m -o ${SITELIBDIR}/lib/${m} \
         -I ${COPYDIR} \
         -I ${SITESRCDIR}/cobol/copy \
        ${SITESRCDIR}/cobol/${f}
    echo "done"
  fi
done

# copy scripts file
echo -n "Copying scripts files..."
for d in scripts/daily scripts/kaisei scripts/monthly scripts/kentan; do
  if test -d "${SITESRCDIR}/${d}"; then
    mkdir -p "${SITELIBDIR}/${d}"
    for f in `ls ${SITESRCDIR}/${d}`; do 
      sed -e 's,\@sysconfdir\@,$(sysconfdir),g' \
      < "${SITESRCDIR}/${d}/${f}" > "${SITELIBDIR}/${d}/${f}"
    done
  fi
done
echo "done"

# copy data files
echo -n "Copying data files..."
for d in data doc etc form init lddef record screen scripts/allways ; do
  if test -d "${SITESRCDIR}/${d}"; then
    mkdir -p "${SITELIBDIR}/${d}"
    chown orca.orca "${SITELIBDIR}/${d}"
    for f in `ls ${SITESRCDIR}/${d}`; do 
      cp "${SITESRCDIR}/${d}/${f}" "${SITELIBDIR}/${d}"
    done
  fi
done
echo "done"
