const dateForQuery = () => {
  const currentMonth = new Date().getMonth() + 1;

  if (currentMonth > 9)
    return (new Date().getFullYear() + "-" + currentMonth);

  return (new Date().getFullYear() + "-0" + currentMonth);

};

module.exports = {
  dateForQuery
}